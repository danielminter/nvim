local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", default_opts, {desc = "Open file explorer"})
keymap("n", "H", ":BufferLineMovePrev<CR>", default_opts, {desc = "Previous Buffer"})
keymap("n", "L", ":BufferLineMoveNext<CR>", default_opts, {desc = "Next Buffer"})
