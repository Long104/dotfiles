
abbr -a r "R_AUTO_START=true nvim"
abbr -a ls "eza --color always --icons=always"
# abbr -a ls "eza --color always --icons=always"
# abbr -aes
abbr -a own "sudo chown -R pantornchuavallee:staff ."
abbr -a ff "clear;wezterm imgcat ~/dotfiles/fastfetch/logos/zen.png --width 26 --height 10 --position 0,9 | fastfetch --raw - --logo-width 20 --logo-height 8"
abbr -a c 'clear'
abbr -a cd 'z'
abbr -a ls "eza --color=always --icons=always"
abbr -a lt "eza --color=always --icons=always -T "
# abbr -a ls "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
abbr -a nf "clear && neofetch"
abbr -a apprun "osascript -e 'tell application \"System Events\" to return name of processes whose background only is false'"
abbr -a psrun 'ps ux -p $(osascript -e "tell application \"System Events\" to return unix id of processes whose background only is false")'
# abbr -a convert '~/dotfiles/script/.config/script/350-image-to-all.sh'
abbr -a docker_clean_images 'docker rmi $(docker images -a --filter=dangling=true -q)'
abbr -a docker_clean_ps 'docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
abbr -a docker_clean_cache_x 'docker buildx prune -f'
abbr -a docker_clear_cache 'docker builder prune'
abbr -a git-bare "git --git-dir=$HOME/dotfiles --work-tree=$HOME"
abbr -a n "nvim"
abbr -a f "nvim -c ':Telescope find_files'"
abbr -a py-activate "source ~/myenv/bin/activate.fish"
abbr -a py-deactivate "deactivate"
abbr -a s "NVIM_APPNAME=Shoshinvim nvim"
abbr -a start "time ZSH_DEBUGRC=1 zsh -i -c exit"
abbr -a la "eza -a"
abbr -a dr "darwin-rebuild switch --flake ~/dotfiles/nix-darwin"
abbr -a cat "bat"

# Git
abbr -a gc "git commit -m"
abbr -a gca "git commit -a -m"
abbr -a gp "git push origin HEAD"
abbr -a gpu "git pull origin"
abbr -a gst "git status"
abbr -a glog "git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
abbr -a gdiff "git diff"
abbr -a gco "git checkout"
abbr -a gb "git branch"
abbr -a gba "git branch -a"
abbr -a gadd "git add"
abbr -a ga "git add -p"
abbr -a gcoall "git checkout -- ."
abbr -a gr "git remote"
abbr -a gre "git reset"

# kubectl
abbr -a k "kubectl"
abbr -a ka "kubectl apply -f"
abbr -a kg "kubectl get"
abbr -a kd "kubectl describe"
abbr -a kdel "kubectl delete"
abbr -a kl "kubectl logs"
abbr -a kgpo "kubectl get pod"
abbr -a kgd "kubectl get deployments"
abbr -a kc "kubectx"
abbr -a kns "kubens"
abbr -a kl "kubectl logs -f"
abbr -a ke "kubectl exec -it"
abbr -a kv "kubectl config view --minify | grep namespace"
abbr -a knd "kubectl config set-context --current --namespace=default"

# cd in to todo and nvim and create tmux splitpane and daily obsidian
