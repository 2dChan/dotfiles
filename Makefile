.PHONY: stow clean install

PACKAGES = fish git lsd neovim nodejs24 stow
STOW_ARGS = --dotfiles -v

stow:
	mkdir -p ../.config
	stow $(STOW_ARGS) .

clean:
	stow $(STOW_ARGS) -D .

install:
	@echo "Finding supported package manager..."
	@if command -v port >/dev/null 2>&1; then \
		echo "Find MacPorts. Install: $(PACKAGES)"; \
		sudo port install $(PACKAGES); \
	else \
		echo "Supported package manager not found."; \
		exit 1; \
	fi
