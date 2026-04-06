return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		local parsers = {
			"c",
			"python",
			"go",
			"rust",
			"typescript",
			"html",
			"json",
			"css",
			"lua",
			"yaml",
			"bash",
			"gitcommit",
			"git_rebase",
			"git_config",
			"gitignore",
			"gitattributes",
			"dockerfile",
		}

		ts.setup()
		ts.install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("nvim-treesitter-start", { clear = true }),
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
