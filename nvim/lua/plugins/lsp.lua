return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/nvim-cmp", -- should be initiated before lspconfig to access capabilities
	},
	config = function()
		local config = require("config.lsp")
		for server, serverConfig in pairs(config) do
			vim.lsp.config(server, serverConfig)
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local servers = { "gopls", "stylua" }
		for _, s in ipairs(servers) do
			vim.lsp.config(s, {
				capabilities = capabilities,
			})
			vim.lsp.enable(s)
		end
	end,
}
