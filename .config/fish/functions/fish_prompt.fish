function fish_prompt
    # Cache exit status
    set -l last_status $status

    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (uname -n|cut -d . -f 1)
    end
    if not set -q __fish_prompt_char
        switch (id -u)
            case 0
                set -g __fish_prompt_char '#'
            case '*'
                set -g __fish_prompt_char '$'
        end
    end

    # Setup colors
    set -l hostcolor (set_color (uname -n | md5sum | cut -f1 -d' ' | tr -d '\n' | tail -c6))
    set -l normal (set_color normal)
    set -l white (set_color FFFFFF)
    set -l turquoise (set_color 5fdfff)
    set -l orange (set_color df5f00)
    set -l blue (set_color blue)
    set -l limegreen (set_color 87ff00)
    set -l hotpink (set_color CB1C8D)
    set -l pink (set_color F56EB3)
    set -l purple (set_color 7F167F)
    set -l darkpurple (set_color 460C68)

    set -l primary_color (set_color   FDEBF7)
    set -l secondary_color (set_color FBCAFF)
    set -l third_color (set_color     FFADF0)
    set -l fourth_color (set_color    FC28FB)


    # Configure __fish_git_prompt
    set -g __fish_git_prompt_char_stateseparator ' '
    set -g __fish_git_prompt_color 5fdfff
    set -g __fish_git_prompt_color_flags df5f00
    set -g __fish_git_prompt_color_prefix white
    set -g __fish_git_prompt_color_suffix white
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_showstashstate true
    set -g __fish_git_prompt_show_informative_status true

    set -l current_user (whoami)

    ##
    ## Line 1
    ##
    echo -n $fourth_color'╭─ '$primary_color$current_user$fourth_color' at '$secondary_color$__fish_prompt_hostname$fourth_color' in '$primary_color(pwd|sed "s=$HOME=~=")$third_color
    __fish_git_prompt " (%s)"
    echo

    ##
    ## Line 2
    ##
    echo -n $fourth_color'╰'

    # Disable virtualenv's default prompt
    set -g VIRTUAL_ENV_DISABLE_PROMPT true

    # support for virtual env name
    if set -q VIRTUAL_ENV
        echo -n "($third_color"(basename "$VIRTUAL_ENV")"$white)"
    end

    ##
    ## Support for vi mode
    ##
    set -l lambdaViMode "$THEME_LAMBDA_VI_MODE"

    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        if test -z (string match -ri '^no|false|0$' $lambdaViMode)
            set_color --bold
            echo -n $fourth_color'─['
            switch $fish_bind_mode
                case default
                    set_color red
                    echo -n n
                case insert
                    set_color green
                    echo -n i
                case replace_one
                    set_color green
                    echo -n r
                case replace
                    set_color cyan
                    echo -n r
                case visual
                    set_color magenta
                    echo -n v
            end
            echo -n $fourth_color']'
        end
    end

    ##
    ## Rest of the prompt
    ##
    echo -n $fourth_color'─ '$secondary_color$__fish_prompt_char $normal
end
