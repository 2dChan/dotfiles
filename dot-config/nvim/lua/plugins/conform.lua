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
				args = { "-st" },
				stdin = true,
			},
		},
		formatters_by_ft = {
			c = { "bsd_indent" },
			lua = { "stylua" },
			python = { "isort", "black" },
			go = { "goimports", "gofmt" },
			typescript = { "prettier" },
			javascript = { "prettier" },
			svelte = { "prettier" },
			scss = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			markdown = { "prettier" },
		},
	},
}
