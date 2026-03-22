vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.signcolumn = "no"
vim.opt.cursorline = true
vim.opt.winborder = "rounded"
vim.opt.termguicolors = true

-- Clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Indentation & Tabs
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.preserveindent = true

-- Line and wrapping
vim.opt.colorcolumn = "100"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "=> "
vim.opt.fillchars = { eob = " ", vert = "│", fold = "·" }

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Undo & command preview
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.inccommand = "split"

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Scrolling
vim.opt.scrolloff = 10

-- Confirm dialogs on unsaved changes
vim.opt.confirm = true
