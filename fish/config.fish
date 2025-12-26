# if status is-interactive
# mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
# end



fish_add_path /Users/pantornchuavallee/.spicetify

# Added by LM Studio CLI (lms)
# set -gx PATH $PATH /Users/pantornchuavallee/.lmstudio/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# if test -f /opt/homebrew/anaconda3/bin/conda
#     eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/opt/homebrew/anaconda3/etc/fish/conf.d/conda.fish"
#         . "/opt/homebrew/anaconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/opt/homebrew/anaconda3/bin" $PATH
#     end
# end
# <<< conda initialize <<<


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :


# Added by Antigravity
fish_add_path /Users/pantornchuavallee/.antigravity/antigravity/bin
