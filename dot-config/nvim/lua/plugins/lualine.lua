return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'AndreM222/copilot-lualine',
    },
    opts = {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,

        disabled_filetypes = { statusline = { 'dashboard', 'snacks_dashboard' } },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
          { 'filename', padding = { left = 0, right = 1 } },
        },
        lualine_x = { 'copilot', 'diagnostics' },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
