set -g fish_greeting ""

if test (uname) = "Darwin"
    # Macports
    set -gx PATH /opt/local/bin /opt/local/sbin $PATH

    set -U fish_user_paths ~/.local/bin $fish_user_paths
end

# Dev
set -gx EDITOR nvim
set -gx GOPATH $HOME/.local/go

if status is-interactive
    alias ls='lsd --group-directories-first'

    # --- Autoinstall fisher and plugins ---
    if not functions -q fisher
        echo "Install fisher..."
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    end

    set plugins (cat ~/.config/fish/fish_plugins)
    for plugin in $plugins
        if not fisher list | grep -Fq $plugin
            echo "Install plugin: $plugin..."
            fisher install $plugin
        end
    end
end
