return {
  'nvimdev/dashboard-nvim',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      config = {
        header = {
          '',
          '',
          '',
          '',
          '',
          '',
          [[ ███▄    █     ▒█████      ██▓    ▄████▄     ▓█████   ]],
          [[ ██ ▀█   █    ▒██▒  ██▒   ▓██▒   ▒██▀ ▀█     ▓█   ▀   ]],
          [[▓██  ▀█ ██▒   ▒██░  ██▒   ▒██▒   ▒▓█    ▄    ▒███     ]],
          [[▓██▒  ▐▌██▒   ▒██   ██░   ░██░   ▒▓▓▄ ▄██▒   ▒▓█  ▄   ]],
          [[▒██░   ▓██░   ░ ████▓▒░   ░██░   ▒ ▓███▀ ░   ░▒████▒  ]],
          [[░ ▒░   ▒ ▒    ░ ▒░▒░▒░    ░▓     ░ ░▒ ▒  ░   ░░ ▒░ ░  ]],
          [[░ ░░   ░ ▒░     ░ ▒ ▒░     ▒ ░     ░  ▒       ░ ░  ░  ]],
          [[   ░   ░ ░    ░ ░ ░ ▒      ▒ ░   ░              ░     ]],
          [[         ░        ░ ░      ░     ░ ░            ░  ░  ]],
          [[                                 ░                    ]],
        },
        center = {},
        shortcut = {},
        footer = { '' },
        packages = {
          enable = false,
        },
        project = {
          enable = false,
        },
        mru = {
          enable = false,
        },
        disable_move = true,
      },
    }
  end,
}
