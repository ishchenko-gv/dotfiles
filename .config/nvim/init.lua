require('core.keymaps')
require('core.plugins')
require('core.plugin_config')

vim.cmd("language en_US")

vim.wo.number = true
vim.wo.relativenumber = true

-- Make transparent background and disble cursor line color
vim.opt.cursorline = false
vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
