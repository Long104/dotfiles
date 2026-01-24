# ~/.config/fish/functions/todo.fish
function todo
    set -l session "todo📝"
    set -l todo_dir /Users/pantornchuavallee/satori/note/todo
    set -l daily_dir /Users/pantornchuavallee/satori/note/dailyNote
    set -l nv "env NVIM_APPNAME=Shoshinvim nvim"

    if test -z "$TMUX"
        if tmux has-session -t $session 2>/dev/null
            tmux attach -t $session
        else
            tmux new-session -d -s $session -c $todo_dir

            # Split vertically, create pane 2
            tmux split-window -v -t "$session:1.1" -c $todo_dir

            # Top pane: open TODO.md
            tmux send-keys -t "$session:1.1" "$nv $todo_dir/TODO.md" Enter

            # Bottom pane: go to dailyNote and open TODO.md + run :Obsidian today inside Neovim
            tmux send-keys -t "$session:1.2" "cd $daily_dir" Enter
            # small wait to ensure shell cd completes before starting nvim
            sleep 0.2
            # tmux send-keys -t "$session:1.2" "$nv $daily_dir/TODO.md -c ':Obsidian today'" Enter

            tmux attach -t $session
        end
    else
        if tmux has-session -t $session 2>/dev/null
            tmux switch -t $session
        else
            tmux new-session -d -s $session -c $todo_dir
            tmux split-window -v -t "$session:1.1" -c $todo_dir

            tmux send-keys -t "$session:1.1" "$nv $todo_dir/TODO.md" Enter

            tmux send-keys -t "$session:1.2" "cd $daily_dir" Enter
            sleep 0.2
            # tmux send-keys -t "$session:1.2" "$nv $daily_dir/TODO.md -c ':Obsidian today'" Enter

            tmux switch -t "$session"
        end
    end
end
