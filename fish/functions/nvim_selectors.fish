function nvim_selectors
    set items "ZenVim" "default" "Shoshinvim" "neobean" "zenzen" "NvChad" "SnoVim" "NebulaNvim" "javaNvim" "xen" "nvimBlade" "laravelNvim"
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config" --height=~50% --layout=reverse --border --exit-0)

    if test -z "$config"
        echo "Nothing selected"
        return 0
    else if test "$config" = "default"
        set config ""
    end

    env NVIM_APPNAME=$config nvim $argv
end
