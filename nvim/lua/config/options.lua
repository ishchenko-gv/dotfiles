local opt = vim.opt

-- Enable line numbers
opt.number = true

-- Enable relative line numbers
opt.relativenumber = true

-- Visual tab size
opt.tabstop = 2

-- Autoindent size
opt.shiftwidth = 4

-- Use spaces instead of tabs
opt.expandtab = true

-- Autoindent
opt.smartindent = true

-- 24-bit truecolor
opt.termguicolors = true

-- Make search case insensitive
opt.ignorecase = true

-- Show diagnostic only in normal mode
vim.diagnostic.config({
	update_in_insert = false,
})
