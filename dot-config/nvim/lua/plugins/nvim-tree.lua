return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '\\', '<cmd>NvimTreeToggle<CR>', desc = 'NvimTree toggle', silent = true },
  },
  opts = {
    disable_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    git = { enable = false },
    filters = { dotfiles = true },
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      width = 32,
      preserve_window_proportions = true,
    },
    renderer = {
      root_folder_label = false,
      indent_markers = { enable = false },
      icons = {
        web_devicons = {
          folder = {
            enable = false,
            color = false,
          },
        },
      },
    },
  },
}
