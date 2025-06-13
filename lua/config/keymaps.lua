local map = vim.keymap.set

-- Force Exit Neovim
map('n', '<leader>qq', '<cmd>qall!<cr>', { desc = 'Exit Neovim' })

-- Clear search results
map('n', '<C-space>', '<cmd>noh<cr>', {})
