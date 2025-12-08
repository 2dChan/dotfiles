return {
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			"folke/lazydev.nvim",
			"nvim-tree/nvim-web-devicons",
			"onsails/lspkind.nvim",
			"fang2hou/blink-copilot",
		},
		opts = {
			keymap = { preset = "super-tab" },

			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 2000 },
				ghost_text = { enabled = true },
				menu = {
					draw = {
						gap = 3,
						columns = { { "label", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
						components = {
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
					},
				},
			},

			sources = {
				default = { "lsp", "path", "lazydev", "buffer", "copilot" },
				providers = {
					lazydev = {
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
						opts = {
							kind_name = " Copilot",
						},
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },

			signature = { enabled = true },
		},
	},
}
