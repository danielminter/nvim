local opt = vim.opt

opt.mouse = ''

-- Leader
vim.g.mapleader = " "

-- Tabs and spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
vim.expandtab = true
opt.smarttab = true

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Scrolling
opt.scrolloff = 10

-- Text Wrapping
opt.wrap = false

-- Backspace Function
opt.backspace = { "start", "eol", "indent" }

-- Windows
opt.splitbelow = true
opt.splitright = true

-- Search Settings
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Shell
opt.shell = "zsh"
