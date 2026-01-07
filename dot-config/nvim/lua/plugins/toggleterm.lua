return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      vim.keymap.set('n', '<leader>tt', '<CMD>ToggleTerm direction=float<CR>', { desc = '[T]oggle [T]erminal' }),
      vim.keymap.set('t', '<c-e>', '<CMD>ToggleTerm<CR>', { desc = '[T]oggle [T]erminal' }),
    },
  },
}
