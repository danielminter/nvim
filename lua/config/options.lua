local opt = vim.opt
-- Theme
vim.g.default_colorscheme = "tokyonight-night"

-- Options --------------------------------------------------------------------
opt.breakindent = true -- Wrap indent to match  line start.
opt.clipboard = "unnamedplus" -- Connection to the system clipboard.
opt.cmdheight = 0 -- Hide command line unless needed.
opt.completeopt = { "menu", "menuone", "noselect" } -- Options for insert mode completion.
opt.copyindent = true -- Copy the previous indentation on autoindenting.
opt.cursorline = true -- Highlight the text line of the cursor.
opt.expandtab = true -- Enable the use of space in tab.
opt.fileencoding = "utf-8" -- File content encoding for the buffer.
opt.fillchars = { eob = " " } -- Disable `~` on nonexistent lines.
opt.foldenable = true -- Enable fold for nvim-ufo.
opt.foldlevel = 99 -- set highest foldlevel for nvim-ufo.
opt.foldlevelstart = 99 -- Start with all code unfolded.
opt.foldcolumn = "1" -- Show foldcolumn in nvim 0.9+.
opt.ignorecase = true -- Case insensitive searching.
opt.infercase = true -- Infer cases in keyword completion.

opt.laststatus = 3 -- Global statusline.
opt.linebreak = true -- Wrap lines at 'breakat'.
opt.number = true -- Show numberline.
opt.preserveindent = true -- Preserve indent structure as much as possible.
opt.pumheight = 10 -- Height of the pop up menu.
opt.relativenumber = true -- Show relative numberline.
opt.shiftwidth = 2 -- Number of space inserted for indentation.
opt.showmode = false -- Disable showing modes in command line.
opt.showtabline = 2 -- always display tabline.
opt.signcolumn = "yes" -- Always show the sign column.
opt.smartcase = true -- Case sensitivie searching.
opt.smartindent = false -- Smarter autoindentation.
opt.splitbelow = true -- Splitting a new window below the current one.
opt.splitright = true -- Splitting a new window at the right of the current one.
opt.tabstop = 2 -- Number of space in a tab.

opt.termguicolors = true -- Enable 24-bit RGB color in the TUI.
opt.undofile = true -- Enable persistent undo between session and reboots.
opt.updatetime = 300 -- Length of time to wait before triggering the plugin.
opt.virtualedit = "block" -- Allow going past end of line in visual block mode.
opt.writebackup = false -- Disable making a backup before overwriting a file.
opt.shada = "!,'1000,<50,s10,h" -- Remember the last 1000 opened files
opt.history = 1000 -- Number of commands to remember in a history table (per buffer).
opt.swapfile = false -- Ask what state to recover when opening a file that was not saved.
opt.wrap = true -- Disable wrapping of lines longer than the width of window.
opt.colorcolumn = "80" -- PEP8 like character limit vertical bar.
opt.mousescroll = "ver:1,hor:0" -- Disables hozirontal scroll in neovim.
opt.guicursor = "n:blinkon200,i-ci-ve:ver25" -- Enable cursor blink.
opt.autochdir = true -- Use current file dir as working dir (See project.nvim).
opt.scrolloff = 1000 -- Number of lines to leave before/after the cursor when scrolling. Setting a high value keep the cursor centered.
opt.sidescrolloff = 8 -- Same but for side scrolling.
opt.selection = "old" -- Don't select the newline symbol when using <End> on visual mode.

opt.viewoptions:remove "curdir" -- Disable saving current directory with views.
opt.shortmess:append { s = true, I = true } -- Disable startup message.
opt.backspace:append { "nostop" } -- Don't stop backspace at insert.
opt.diffopt:append { "algorithm:histogram", "linematch:60" } -- Enable linematch diff algorithm

-- Globals --------------------------------------------------------------------
vim.g.mapleader = " " -- Set leader key.
vim.g.maplocalleader = " " -- Set default local leader key.
vim.g.big_file = { size = 1024 * 5000, lines = 50000 } -- For files bigger than this, disable 'treesitter' (+5Mb).

-- The next globals are toggleable with <space + l + u>
vim.g.autoformat_enabled = true -- Enable auto formatting at start.
vim.g.autopairs_enabled = true -- Enable autopairs at start.
vim.g.cmp_enabled = true -- Enable completion at start.
vim.g.codeactions_enabled = true -- Enable displaying 💡 where code actions can be used.
vim.g.codelens_enabled = true -- Enable automatic codelens refreshing for lsp that support it.
vim.g.diagnostics_mode = 3 -- Set code linting (0=off, 1=only show in status line, 2=virtual text off, 3=all on).
vim.g.fallback_icons_enabled = false -- Enable it if you need to use Neovim in a machine without nerd fonts.
vim.g.inlay_hints_enabled = false -- Enable always show function parameter names.
vim.g.lsp_round_borders_enabled = true -- Enable round borders for lsp hover and signatureHelp.
vim.g.lsp_signature_enabled = true -- Enable automatically showing lsp help as you write function parameters.
vim.g.notifications_enabled = true -- Enable notifications.
vim.g.semantic_tokens_enabled = true -- Enable lsp semantic tokens at start.
vim.g.url_effect_enabled = true -- Highlight URLs with an underline effect.
