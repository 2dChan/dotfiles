return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 0,
		icons = {
			mappings = true,
		},
		spec = {
			{ "<leader>s", group = "[S]earch" },
		},
	},
}
