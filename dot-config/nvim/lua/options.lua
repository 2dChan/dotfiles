-- General UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.signcolumn = 'no'
vim.o.cursorline = true
vim.o.winborder = 'rounded'

-- Clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation & Tabs
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.o.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.preserveindent = true

-- Line and wrapping
vim.opt.colorcolumn = '100'
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = '=> '
vim.opt.fillchars = { eob = ' ', vert = '│', fold = '·' }

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Split windows
vim.o.splitright = true
vim.o.splitbelow = true

-- Undo & command preview
vim.o.breakindent = true
vim.o.undofile = true
vim.o.inccommand = 'split'

-- Performance
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Scrollingv
vim.o.scrolloff = 10

-- Confirm dialogs on unsaved changes
vim.o.confirm = true

-- Not sort
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
