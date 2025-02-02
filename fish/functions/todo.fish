function todo
    if test -z "$TMUX"
        if tmux has-session -t todo📝 2>/dev/null
            tmux attach -t todo📝
        else
        tmux new-session -d -s todo📝 -c ~/satori/note/todo
        
        # Split the window vertically (now 2 panes: 0-top, 1-bottom)
        tmux split-window -v -c ~/satori/note/todo -t todo📝:1.1
        
        # Send commands to first pane (top)
        tmux send-keys -t todo📝:1.1 'env NVIM_APPNAME=Shoshinvim nvim TODO.md' C-m
        tmux send-keys -t todo📝:1.1 " "hc
        
        # Send commands to second pane (bottom)
        tmux send-keys -t todo📝:1.2 'env NVIM_APPNAME=Shoshinvim nvim TODO.md -c ":ObsidianDailies"' C-m
        
        # Wait for Neovim to start
        sleep 1
        # Send additional commands to the second pane
        tmux send -t todo📝:1.2 'today'
        sleep 1
        tmux send-keys -t todo📝:1.2 C-m
        tmux send-keys -t todo📝:1.2 " "hc
        
        # Attach to the session after configuration
        tmux attach -t todo📝
        end
      else
        if tmux has-session -t todo📝 2>/dev/null
          tmux switch -t todo📝
        else 
          tmux new-session -d -s todo📝
          tmux send-keys -t todo📝 'cd ~/satori/note/todo' C-m
          tmux split-window -v -c ~/satori/note/todo -t todo📝:1.1
          tmux send-keys -t todo📝:1.1 "env NVIM_APPNAME=Shoshinvim nvim TODO.md" C-m
          tmux send-keys -t todo📝:1.1 " "hc
          tmux send-keys -t todo📝:1.2 "env NVIM_APPNAME=Shoshinvim nvim TODO.md -c ':ObsidianDailies'" C-m
          sleep 1
          tmux send -t todo📝:1.2 "today"
          tmux switch -t todo📝:1.2
          sleep 1
          tmux send-keys -t todo📝:1.2 C-m
          tmux send-keys -t todo📝:1.2 " "hc
        end

    end
  end
