function fish_prompt
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color --bold red)"[$last_status] "(set_color normal)
    end

    echo -ns (set_color --bold blue) "$USER " (set_color -u white)
    pwd | sed 's/\/home\/alessa/~/g' | tr -d '\n'
    echo -ns (set_color normal) (set_color --bold cyan) (fish_git_prompt)
    echo -ns (set_color --bold red) " >>> $stat"
    set_color normal
end
