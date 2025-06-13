return {
  -- File Operations for NeoTree to work with the LSP
  {
	"antosha417/nvim-lsp-file-operations",
	dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
	},
  },

	--  nvim-autopairs [auto close brackets]
  --  https://github.com/windwp/nvim-autopairs
  --  It's disabled by default, you can enable it with <space>ua
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
		config = true,
		opts = {},
  },

	--  better-escape
	{
	  "max397574/better-escape.nvim",
	  config = function()
	    require("better_escape").setup()
	  end,
	},
	--	Which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (Which-key)",
			},
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim"},
		opts = {
			pickers = {
				buffers = {
					theme = 'dropdown',
					sort_lastused = true,
				},
			},
		},
		keys = {
			{
				"<leader>bb",
				"<cmd>Telescope buffers<cr>",
				desc = "Find Buffers (Telescope)",
			},
		},
	},

	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		keys = {
			{
				"<leader>a",
				function () require("harpoon"):list():add() end,
				desc = "Add to Harpoon",
			},
			{
				"<leader>hh",
				function () require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
				desc = "Toggle Harpoon Quick Menu",
			},
			{
				"<leader>h1",
				function () require("harpoon"):list():select(1) end,
				desc = "Goto Harpoon Buffer 1",
			},
			{
				"<leader>h2",
				function () require("harpoon"):list():select(2) end,
				desc = "Goto Harpoon Buffer 2",
			},
			{
				"<leader>h3",
				function () require("harpoon"):list():select(3) end,
				desc = "Goto Harpoon Buffer 3",
			},
			{
				"<leader>h4",
				function () require("harpoon"):list():select(4) end,
				desc = "Goto Harpoon Buffer 4",
			},
			{
				"<leader>hn",
				function () require("harpoon"):list():next() end,
				desc = "Goto Next Harpoon Buffer",
			},
			{
				"<leader>hp",
				function () require("harpoon"):list():prev() end,
				desc = "Goto Prev Harpoon Buffer",
			},
		},
	},
}
