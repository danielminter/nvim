return {
-- Auto formatting
{
		"lukas-reineke/lsp-format.nvim",
		opts = {},
		keys = {},
	},

	-- blink [Auto completion]
	{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'super-tab' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
	lazydev = {
	name = "LazyDev",
	module = "lazydev.integrations.blink",
	-- make lazydev completions top priority (see `:h blink.cmp`)
	score_offset = 100,
	},
      },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },
    -- Set the offset for the file explorer
  },

  config = function()
    require("blink.cmp").setup()
  end,
  opts_extend = { "sources.default" }
  },

	-- nvim-lspconfig [lsp configs]
	{
		"neovim/nvim-lspconfig",
		event = "VimEnter",
		lazy = false,
	},

	-- mason-lspconfig [auto start lsp]
  -- https://github.com/mason-org/mason-lspconfig.nvim
  -- This plugin auto starts the lsp servers installed by Mason
  -- every time Neovim trigger the event FileType.
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
	    { "mason-org/mason.nvim", opts = {} },
	    "neovim/nvim-lspconfig"
    },
    opts = {
			ensure_installed = { "lua_ls" },
		},
  },

  --  mason [lsp package manager]
  --  https://github.com/mason-org/mason.nvim
  --  https://github.com/zeioth/mason-extra-cmds
  {
    "mason-org/mason.nvim",
    dependencies = { "zeioth/mason-extra-cmds", opts = {} },
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
      "MasonUpdateAll", -- this cmd is provided by mason-extra-cmds
    },
    opts = {
      registries = {
        "github:nvim-java/mason-registry",
        "github:mason-org/mason-registry",
      },
    }
  },

-- Lazygit integration
{
"kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
    },
	{
	"folke/snacks.nvim",
	  priority = 1000,
	  lazy = false,
	  ---@type snacks.Config
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	    bigfile = { enabled = true },
	    dashboard = { enabled = true },
	    explorer = { enabled = true },
	    indent = { enabled = true },
	    input = { enabled = true },
	    picker = { enabled = true },
	    notifier = { enabled = true },
	    quickfile = { enabled = true },
	    scope = { enabled = true },
	    scroll = { enabled = true },
	    statuscolumn = { enabled = true },
	    words = { enabled = true },
	  },
	  keys = {
	  -- Top Pickers & Explorer
	    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
	    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
	    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
	    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
	    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
	    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
	    -- find
	    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
	    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
	    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
	    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
	    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
	    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
	    -- git
	    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
	    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
	    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
	    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
	    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
	    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
	    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
	    -- Grep
	    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
	    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
	    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
	    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
	    -- search
	    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
	    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
	    { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
	    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
	    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
	    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
	    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
	    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
	    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
	    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
	    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
	    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
	    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
	    { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
	    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
	    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
	    { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
	    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
	    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
	    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
	    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
	    -- LSP
	    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
	    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
	    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
	    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
	    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
	    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
	    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
	    -- Other
	    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
	    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
	    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
	    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
	    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
	    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
	    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
	    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
	    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
	    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
	    { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
	    { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
	    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
	    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
	    {
	      "<leader>N",
	      desc = "Neovim News",
	      function()
		Snacks.win({
		  file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
		  width = 0.6,
		  height = 0.6,
		  wo = {
		    spell = false,
		    wrap = false,
		    signcolumn = "yes",
		    statuscolumn = " ",
		    conceallevel = 3,
		  },
		})
	      end,
	    }
	  },
	  init = function()
	    vim.api.nvim_create_autocmd("User", {
	      pattern = "VeryLazy",
	      callback = function()
		-- Setup some globals for debugging (lazy-loaded)
		_G.dd = function(...)
		  Snacks.debug.inspect(...)
		end
		_G.bt = function()
		  Snacks.debug.backtrace()
		end
		vim.print = _G.dd -- Override print to use snacks for `:=` command

		-- Create some toggle mappings
		Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
		Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
		Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
		Snacks.toggle.diagnostics():map("<leader>ud")
		Snacks.toggle.line_number():map("<leader>ul")
		Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
		Snacks.toggle.treesitter():map("<leader>uT")
		Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		Snacks.toggle.inlay_hints():map("<leader>uh")
		Snacks.toggle.indent():map("<leader>ug")
		Snacks.toggle.dim():map("<leader>uD")
	      end,
	    })
	  end,
	},

	{
	  "folke/todo-comments.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  opts = {},
	  keys = {},
	},

	{
	  "L3MON4D3/LuaSnip",
	  -- follow latest release.
	  version = "v2.*",
	  build = "make install_jsregexp",
	  opts = {},
	  keys = {},
	},

	{
	  "folke/persistence.nvim",
	  event = "BufReadPre", -- this will only start session saving when an actual file was opened
	  opts = {},
	  keys = {},
	},

	--  TREE SITTER ---------------------------------------------------------
  --  [syntax highlight]
  --  https://github.com/nvim-treesitter/nvim-treesitter
  --  https://github.com/windwp/nvim-treesitter-textobjects
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = "User BaseDefered",
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    build = ":TSUpdate",
    opts = {
      auto_install = false, -- Currently bugged. Use [:TSInstall all] and [:TSUpdate all]

      incremental_selection = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ak"] = { query = "@block.outer", desc = "around block" },
            ["ik"] = { query = "@block.inner", desc = "inside block" },
            ["ac"] = { query = "@class.outer", desc = "around class" },
            ["ic"] = { query = "@class.inner", desc = "inside class" },
            ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
            ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
            ["af"] = { query = "@function.outer", desc = "around function " },
            ["if"] = { query = "@function.inner", desc = "inside function " },
            ["al"] = { query = "@loop.outer", desc = "around loop" },
            ["il"] = { query = "@loop.inner", desc = "inside loop" },
            ["aa"] = { query = "@parameter.outer", desc = "around argument" },
            ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]k"] = { query = "@block.outer", desc = "Next block start" },
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]a"] = { query = "@parameter.inner", desc = "Next parameter start" },
          },
          goto_next_end = {
            ["]K"] = { query = "@block.outer", desc = "Next block end" },
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]A"] = { query = "@parameter.inner", desc = "Next parameter end" },
          },
          goto_previous_start = {
            ["[k"] = { query = "@block.outer", desc = "Previous block start" },
            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
            ["[a"] = { query = "@parameter.inner", desc = "Previous parameter start" },
          },
          goto_previous_end = {
            ["[K"] = { query = "@block.outer", desc = "Previous block end" },
            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
            ["[A"] = { query = "@parameter.inner", desc = "Previous parameter end" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            [">K"] = { query = "@block.outer", desc = "Swap next block" },
            [">F"] = { query = "@function.outer", desc = "Swap next function" },
            [">A"] = { query = "@parameter.inner", desc = "Swap next parameter" },
          },
          swap_previous = {
            ["<K"] = { query = "@block.outer", desc = "Swap previous block" },
            ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
            ["<A"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
          },
        },
      },
    },
    config = function(_, opts)
      -- calling setup() here is necessary to enable conceal and some features.
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

}
