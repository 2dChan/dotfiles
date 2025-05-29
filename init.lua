vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '80'
vim.opt.mouse = 'a'

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.clipboard:append('unnamedplus')

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = '=> '
vim.opt.fillchars = {
    eob = ' ',
    vert = '│',
    fold = '·',
}

vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line('$') then
            vim.cmd('normal! g`"')
        end
    end
})

require("gruvbox-material").setup()
