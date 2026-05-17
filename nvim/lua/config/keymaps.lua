vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })

-- Buffers
vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<s-tab>", "<cmd>bprev<cr>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })

-- Split management and navigation
-- :vs - create vertical split
-- :sp - create horizontal split
-- <C-w>H - move split left
-- <C-w>J - move split bottom
-- <C-w>K - move split top
-- <C-w>L - move split right
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Focus left split" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Focus bottom split" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Focus top split" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Focus right split" })
vim.keymap.set("n", "<c-x>h", "<:vertical resize -10<cr>>", { silent = true, desc = "Reduce split width" })
vim.keymap.set("n", "<c-x>l", "<:vertical resize +10<cr>>", { silent = true, desc = "Increase split width" })
vim.keymap.set("n", "<c-x>j", "<:resize -10<cr>>", { silent = true, desc = "Reduce split height" })
vim.keymap.set("n", "<c-x>k", "<:resize +10<cr>>", { silent = true, desc = "Increase split height" })

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>T", "<cmd>Telescope<cr>", { desc = "Telescope" })
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>D", telescope.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>gs", telescope.git_status, { desc = "Telescope git status" })

-- LSP
-- :nohlsearch - reset current highlighted search
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
