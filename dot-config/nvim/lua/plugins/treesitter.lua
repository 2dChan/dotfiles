return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			auto_install = true,
			highlight = {
				enable = true,
			},
		},
	},
}
