# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_color_branch yellow
# Status Chars
set __fish_git_prompt_char_dirtystate '✗'

function fish_prompt
    set last_status $status

    set_color blue
    printf '%s ' (date "+%H:%M:%S")

    set_color cyan
    printf '%s' (prompt_pwd)

    set_color normal
    printf '%s ' (__fish_git_prompt)

    if test $last_status -eq 0
        set_color green
    else
        set_color red
    end
    printf '➤ '

    set_color normal
end

# no startup message
function fish_greeting
end
