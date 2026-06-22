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
		{ "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "[G]it Diff [Q]uit" },
	},
	opts = {},
}
