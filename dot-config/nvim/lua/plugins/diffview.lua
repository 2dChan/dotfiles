return {
	"sindrets/diffview.nvim",
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewFileHistory",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "[G]it [D]iff" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "[G]it File [H]istory" },
	},
	config = function()
		require("diffview").setup()

		vim.cmd([[cnoreabbrev <expr> q getcmdtype() == ':' && getcmdline() ==# 'q' && luaeval("require('diffview.lib').get_current_view() ~= nil") ? 'DiffviewClose' : 'q']])
	end,
}
