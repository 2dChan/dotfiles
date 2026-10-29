return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			end
			return {
				timeout_ms = 500,
				lsp_format = "fallback",
			}
		end,
		formatters = {
			bsd_indent = {
				command = "indent",
				args = { "-st", "-ts4", "-i4" },
				stdin = true,
			},
			biome = {
				condition = function(_, ctx)
					return not ctx.filename:match("%.min%.js$")
				end,
			},
			biome_css = {
				inherit = "biome",
				append_args = {
					"--css-formatter-indent-style",
					"tab",
					"--css-formatter-indent-width",
					"4",
				},
			},
			biome_javascript = {
				inherit = "biome",
				append_args = {
					"--javascript-formatter-indent-style",
					"tab",
					"--javascript-formatter-indent-width",
					"4",
					"--javascript-formatter-line-width",
					"100",
				},
			},
		},
		formatters_by_ft = {
			c = { "bsd_indent" },
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			javascript = { "biome_javascript" },
			css = { "biome_css" },
		},
	},
}
