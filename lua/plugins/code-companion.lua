return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        ollama_remote = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "ollama_remote",
            env = {
              url = "http://ubuntu-desktop.serval-ostrich.ts.net:11434",
              api_key = "sk-a36b58d7e2ab452d91baeb527b12493c",
            },
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer ${api_key}",
            },
            parameters = {
              sync = true,
            },
            -- schema = {
            --   model = {
            --     default = "deepseek-r1:14b",
            --   },
            -- },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "ollama_remote",
        },
        inline = {
          adapter = "ollama_remote",
        },
        agent = {
          adapter = "ollama_remote",
        },
      },
      log_level = "TRACE",
    })
  end,
}
