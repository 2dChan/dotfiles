set -g fish_greeting ""

# Macports
set -gx PATH /opt/local/bin /opt/local/sbin $PATH

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

    set plugins (cat ./fish_plugins)
    for plugin in $plugins
        if not fisher list | grep -Fq $plugin
            echo "Install plugin: $plugin..."
            fisher install $plugin
        end
    end
end
