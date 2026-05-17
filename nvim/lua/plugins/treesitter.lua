return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "go", "javascript", "python", "lua" },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
