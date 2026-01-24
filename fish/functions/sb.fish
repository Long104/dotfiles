function sb
    set -l session "second brain 📝"
    set -l shoshin_dir /Users/pantornchuavallee/satori/note/shoshin
    set -l nv "env NVIM_APPNAME=Shoshinvim nvim"

    if test -z "$TMUX"
        if tmux has-session -t $session 2>/dev/null
            tmux attach -t $session
        else
            tmux new-session -d -s $session -c $shoshin_dir

            # Top pane: open TODO.md
            tmux send-keys -t "$session:1.1" "$nv $shoshin_dir/knowledge_base.md" Enter

            sleep 0.2

            tmux attach -t $session
        end
    else
        if tmux has-session -t $session 2>/dev/null
            tmux switch -t $session
        else
            tmux new-session -d -s $session -c $shoshin_dir

            tmux send-keys -t "$session:1.1" "$nv $shoshin_dir/knowledge_base.md" Enter

            sleep 0.2
            # tmux send-keys -t "$session:1.2" "$nv $daily_dir/TODO.md -c ':Obsidian today'" Enter
            tmux switch -t "$session"
        end
    end
end
