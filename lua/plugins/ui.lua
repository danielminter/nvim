return {
	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		depenencies = "nvim-tree/nvim-web-devicons",
    		opts = {
		  offsets = {
		    {
		      filetype = "NvimTree",
		      text = function()
			return vim.fn.getcwd()
		      end,
		      highlight = "Directory",
		      text_align = "left"
		    }
		  },
		},
		keys = {},
	},
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		keys = {},
	},
	-- Neoscroll
	{
		"karb94/neoscroll.nvim",
		lazy = true,
		opts = {},
		keys = {},
	},
	-- Noice
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		lazy = false,
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},

		},
		keys = {},
	},

	--  mini.indentscope [guides]
  --  https://github.com/echasnovski/mini.indentscope
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      draw = { delay = 0, animation = function() return 0 end },
      options = { border = "top", try_as_border = true },
      symbol = "▏",
    },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)

      -- Disable for certain filetypes
      vim.api.nvim_create_autocmd({ "FileType" }, {
        desc = "Disable indentscope for certain filetypes",
        callback = function()
          local ignored_filetypes = {
            "aerial",
            "dashboard",
            "help",
            "lazy",
            "leetcode.nvim",
            "mason",
            "neo-tree",
            "NvimTree",
            "neogitstatus",
            "startify",
            "toggleterm",
            "Trouble",
            "calltree",
            "coverage"
          }
          if vim.tbl_contains(ignored_filetypes, vim.bo.filetype) then
            vim.b.miniindentscope_disable = true
          end
        end,
      })
    end
  },

--  Telescope [search] + [search backend] dependency
  --  https://github.com/nvim-telescope/telescope.nvim
  --  https://github.com/nvim-telescope/telescope-fzf-native.nvim
  --  https://github.com/debugloop/telescope-undo.nvim
  --  NOTE: Normally, plugins that depend on Telescope are defined separately.
  --  But its Telescope extension is added in the Telescope 'config' section.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "debugloop/telescope-undo.nvim",
        cmd = "Telescope",
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = vim.fn.executable("make") == 1,
        build = "make",
      },
    },
    cmd = "Telescope",
    opts = function()
      local actions = require("telescope.actions")
      local mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<ESC>"] = actions.close,
          ["<C-c>"] = false,
        },
        n = { ["q"] = actions.close },
      }
      return {
        defaults = {
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.50,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = mappings,
        },
        extensions = {
          undo = {
            use_delta = true,
            side_by_side = true,
            vim_diff_opts = { ctxlen = 0 },
            entry_format = "󰣜 #$ID, $STAT, $TIME",
            layout_strategy = "horizontal",
            layout_config = {
              preview_width = 0.65,
            },
            mappings = {
              i = {
                ["<cr>"] = require("telescope-undo.actions").yank_additions,
                ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                ["<C-cr>"] = require("telescope-undo.actions").restore,
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      -- Here we define the Telescope extension for all plugins.
      -- If you delete a plugin, you can also delete its Telescope extension.
      if utils.is_available("nvim-notify") then telescope.load_extension("notify") end
      if utils.is_available("telescope-fzf-native.nvim") then telescope.load_extension("fzf") end
      if utils.is_available("telescope-undo.nvim") then telescope.load_extension("undo") end
      if utils.is_available("project.nvim") then telescope.load_extension("projects") end
      if utils.is_available("LuaSnip") then telescope.load_extension("luasnip") end
      if utils.is_available("aerial.nvim") then telescope.load_extension("aerial") end
      if utils.is_available("nvim-neoclip.lua") then
        telescope.load_extension("neoclip")
        telescope.load_extension("macroscope")
      end
    end,
  },

  --  UI icons [icons]
  --  https://github.com/nvim-tree/nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    enabled = not vim.g.fallback_icons_enabled,
    event = "User BaseDefered",
    opts = {},
  },

  --  LSP icons [icons]
  --  https://github.com/onsails/lspkind.nvim
  {
    "onsails/lspkind.nvim",
    enabled = not vim.g.fallback_icons_enabled,
    opts = {
      mode = "symbol",
      symbol_map = {
        Array = "󰅪",
        Boolean = "⊨",
        Class = "󰌗",
        Constructor = "",
        Key = "󰌆",
        Namespace = "󰅪",
        Null = "NULL",
        Number = "#",
        Object = "󰀚",
        Package = "󰏗",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "󰀬",
        TypeParameter = "󰊄",
        Unit = "",
      },
      menu = {},
    },
    config = function(_, opts)
      require("lspkind").init(opts)
    end,
  },

  --  which-key.nvim [on-screen keybindings]
  --  https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    event = "User BaseDefered",

    opts_extend = { "disable.ft", "disable.bt" },
    opts = {
      preset = "classic", -- "classic", "modern", or "helix"
      icons = {
        group = (vim.g.fallback_icons_enabled and "+") or "",
        rules = false,
        separator = "-",
      },
    },
  },

-- Themes
	-- Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}

