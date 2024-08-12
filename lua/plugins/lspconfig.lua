return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                reportUnusedImport = false,
                reportUnusedFunction = false,
                reportUnusedVariable = false,
              },
            },
          },
        },
      },
    },
  },
}
