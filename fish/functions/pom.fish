# ~/.config/fish/functions/pom.fish
function pom
    # Ask user for split if not set via POMO_SPLIT
    set split $POMO_SPLIT
    if not test -n "$split"
        set split (gum choose "25/5" "50/10" "all done" --header "Choose a pomodoro split.")
    end

    switch $split
        case 25/5
            set work_minutes 25
            set break_minutes 5
        case 50/10
            set work_minutes 50
            set break_minutes 10
        case 'all done'
            return
    end

    # Convert to seconds for sleep
    set work_seconds (math "$work_minutes * 60")
    set break_seconds (math "$break_minutes * 60")

    # Work timer
    echo "Work: $work_minutes minutes..."
    sleep $work_seconds
    terminal-notifier -message "Pomodoro" \
        -title 'Work Timer is up! Take a Break 😊' \
        -sound Crystal

    # Break timer
    if gum confirm "Ready for a break?"
        echo "Break: $break_minutes minutes..."
        sleep $break_seconds
        terminal-notifier -message "Pomodoro" \
            -title 'Break is over! Get back to work 😬' \
            -sound Crystal
    else
        echo "Skipping break."
    end
end
