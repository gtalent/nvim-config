require('nvim-treesitter.configs').setup({
	-- one of "all", "language", or a list of languages
	ensure_installed = {
		"bash",
		"cmake",
		"c",
		"cpp",
		"dart",
		"diff",
		"dockerfile",
		"go",
		"gomod",
		"gitcommit",
		"gitignore",
		"html",
		"kotlin",
		"lua",
		"java",
		"javascript",
		"json",
		"make",
		"markdown",
		"python",
		"rust",
		"toml",
		"typescript",
		"vim",
	},
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
})
