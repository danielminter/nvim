-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- lsp restart
keymap.set("n", "<leader>lr", "<CMD>LspRestart<CR>", opts)
keymap.set("n", "<leader>ls", "<CMD>LspStop<CR>", opts)
keymap.set("n", "<leader>lS", "<CMD>LspStart<CR>", opts)

-- CodeCompanion
keymap.set("n", "<leader>cca", "<CMD>CodeCompanionActions<CR>")
keymap.set("v", "<leader>cca", "<CMD>CodeCompanionActions<CR>")
keymap.set("n", "<leader>ccc", "<CMD>CodeCompanionChat Toggle<CR>")
keymap.set("v", "<leader>ccf", "<CMD>'<,'>CodeCompanion Fix Code<CR>")
keymap.set("v", "<leader>cce", "<CMD>'<,'>CodeCompanion Explain<CR>")
keymap.set("v", "<leader>cct", "<CMD>'<,'>CodeCompanion Unit Tests<CR>")
keymap.set("n", "<leader>ccg", "<CMD>CodeCompanion Generate a Commit Message<CR>")
