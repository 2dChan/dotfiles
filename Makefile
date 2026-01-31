.PHONY: stow clean install add

PACKAGES = fish fzf git lsd neovim nodejs24 stow tmux
STOW_ARGS = --dotfiles -v

stow:
	mkdir -p ../.config
	mkdir -p ../.local/bin
	stow $(STOW_ARGS) .

clean:
	stow $(STOW_ARGS) -D .

add:
	mkdir -p ./dot-config
	@for folder in $(DIRS); do \
		if [ -d ../.config/$$folder ]; then \
			if [ -e ./dot-config/$$folder ]; then \
				echo "Folder $$folder already exists in ./dot-config/"; \
				continue; \
			fi; \
			if [ -L ../.config/$$folder ]; then \
				echo "Folder $$folder is a symlink in ../.config, skipping"; \
				continue; \
			fi; \
			echo "Moving $$folder from ../.config to ./dot-config/"; \
			mv ../.config/$$folder ./dot-config/ || echo "Move failed for $$folder"; \
		else \
			echo "Folder $$folder not found in ../.config"; \
		fi \
	done
	$(MAKE) stow

install:
	@echo "Finding supported package manager..."
	@if command -v port >/dev/null 2>&1; then \
		echo "Find MacPorts. Install: $(PACKAGES)"; \
		sudo port install $(PACKAGES); \
	else \
		echo "Supported package manager not found."; \
		exit 1; \
	fi
