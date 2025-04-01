return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    opts = {
      layouts = {
        {
          elements = {
            { id = "console", size = 0.5 },
            { id = "repl", size = 0.5 },
          },
          position = "left",
          size = 50,
        },
        {
          elements = {
            { id = "scopes", size = 0.50 },
            { id = "breakpoints", size = 0.20 },
            { id = "stacks", size = 0.15 },
            { id = "watches", size = 0.15 },
          },
          position = "bottom",
          size = 15,
        },
      },
    },
    config = function(_, opts)
      require("dapui").setup(opts)

      local listener = require("dap").listeners
      listener.after.event_initialized["dapui_config"] = function()
        require("dapui").open()
      end
      listener.before.event_terminated["dapui_config"] = function()
        require("dapui").close()
      end
      listener.before.event_exited["dapui_config"] = function()
        require("dapui").close()
      end
      vim.keymap.set("n", "<localleader>T", function()
        require("dapui").toggle()
      end, { desc = "Toggle DAP UI" })
    end,
  },
}
