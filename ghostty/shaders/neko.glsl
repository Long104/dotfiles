
const vec3 bg = vec3(84.0 / 255.0, 54.0 / 255.0, 99.0 / 255.0);

const vec3 colors[8] = vec3[8](
    vec3(1.0, 1.0, 1.0),
    vec3(0.88, 0.32, 0.32),
    vec3(0.96, 0.66, 0.24),
    vec3(0.96, 0.84, 0.24),
    vec3(0.4, 0.8, 0.6),
    vec3(0.4, 0.73, 0.8),
    vec3(0.67, 0.4, 0.8),
    vec3(0.55, 0.35, 0.65)
);

const ivec2 size = ivec2(12, 20);

// 000000000000
// 001000001000
// 001000001000
// 001000001000
// 001000001000
// 011100011100
// 010100010100
// 010111110100
// 110011100110
// 100000000010
// 100000000010
// 100100010010
// 100100010010
// 100100010010
// 100100010010
// 100100010010
// 100000000010
// 110000000110
// 011111111100
// 001111111000

// pack binary into 32bit int
const int neko_stroke_map[] = int[](
    0x00020820,
    0x82082087,
    0x1C5145F4,
    0xCE680280,
    0x29129129,
    0x12912912,
    0x802C067F,
    0xC3F80000
);

// 000000000000
// 001000001000
// 001000001000
// 001000001000
// 001000001000
// 011100011100
// 011100011100
// 011111111100
// 111111111110
// 111111111110
// 111111111110
// 111111111110
// 111111111110
// 111111111110
// 111111111110
// 111111111110
// 111111111110
// 111111111110
// 011111111100
// 001111111000

const int neko_fill_map[] = int[](
    0x00020820,
    0x82082087,
    0x1C71C7FC,
    0xFFEFFEFF,
    0xEFFEFFEF,
    0xFEFFEFFE,
    0xFFEFFE7F,
    0xC3F80000
);

int getBit(int[8] map, int index)
{
    return (map[index / 32] >> (31 - index % 32)) & 1;
}

int getNeko(int index)
{
    int stroke = getBit(neko_stroke_map, index);
    int fill = getBit(neko_fill_map, index);
    return fill * 2 - stroke;
}

float smooth_floor(float x, float k) {
    return (tanh(k * (mod(x, 1.0) - 1.0 / 2.0)) + 1.0) / 2.0 + floor(x);
}


float rand(vec2 co) {
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

const vec2 tile_size = vec2(14.0, 24.0);

vec2 slide_uv(vec2 uv, float moving) {
    float chi = mod(floor(uv.x / tile_size.x), 2.0);
    return uv - vec2(0, chi * moving);
}

float derive_k(vec2 uv) {
    vec2 basis = mod(uv, tile_size);
    ivec2 ibasis = ivec2(basis);
    ivec2 c = min(ibasis, size - 1);
    int i = c.x + (size.y - c.y - 1) * size.x;
    return float(getNeko(i));
}

vec4 neko(vec2 uv, float moving) {
    vec2 slided_uv = slide_uv(uv, moving);
    float k = derive_k(slided_uv);
    ivec2 index = ivec2(floor(slided_uv / tile_size));
    float color_index = floor(rand(vec2(index)) * 7.9 + 0.1);
    vec3 color = colors[int(color_index)];
    float special = max(-1.0 * color_index + 1.0, 0.0);
    float special_k = 2.0 * (k - 1.0) * (k - 1.0) - 2.0;
    return vec4(max(color * min(k + special * special_k, 1.0), 0.0), min(k, 1.0));
}

vec4 shadow_neko(vec2 uv, float moving) {
    vec2 slided_uv = slide_uv(uv, moving);
    float k = derive_k(slided_uv);
    return vec4(vec3(0.0), min(k, 1.0));
}

vec4 blend(vec4 color, vec4 base) {
    return color * color.a + base * (1.0 - color.a);
}

const vec2 pixel_size = vec2(0.05, 0.025);

const mat3 transform = mat3(0.89, -0.58, 0.0, 0.16, 0.98, 0.0, 0.0, 0.0, 1.0);

const vec2 shadow_offset = vec2(-0.7, 2.1);

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (2.0 * fragCoord.xy - iResolution.xy) / min(iResolution.x, iResolution.y);
    
    vec2 uv_scaled = ((vec3(uv, 1.0) * transform).xy - iTime * 0.05) / pixel_size;
    float t = iTime * 0.5;
    float slide = smooth_floor(t, 20.0);
    float moving = tile_size.y / 2.0 + tile_size.y * slide;
    float up = max(-1.0 * pow(4.0 * mod(t, 1.0) - 2.5, 4.0) + 1.0, 0.0);
    vec4 neko_layer = neko(uv_scaled, moving);
    vec4 shadow_neko_layer = shadow_neko(uv_scaled + shadow_offset, moving);

    // Output to screen
    fragColor = vec4(bg, 1.0);
    fragColor = blend(shadow_neko_layer, fragColor);
    fragColor = blend(neko_layer, fragColor);
}
