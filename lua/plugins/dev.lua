return {
  --  SNIPPETS ----------------------------------------------------------------
  --  Vim Snippets engine  [snippet engine] + [snippet templates]
  --  https://github.com/L3MON4D3/LuaSnip
  --  https://github.com/rafamadriz/friendly-snippets
  {
    "L3MON4D3/LuaSnip",
    build = not is_windows and "make install_jsregexp" or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "zeioth/NormalSnippets",
      "benfowler/telescope-luasnip.nvim",
    },
    event = "User BaseFile",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      region_check_events = "CursorMoved",
    },
    config = function(_, opts)
      if opts then require("luasnip").config.setup(opts) end
      vim.tbl_map(
        function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
        { "vscode", "snipmate", "lua" }
      )
      -- friendly-snippets - enable standardized comments snippets
      require("luasnip").filetype_extend("typescript", { "tsdoc" })
      require("luasnip").filetype_extend("javascript", { "jsdoc" })
      require("luasnip").filetype_extend("lua", { "luadoc" })
      require("luasnip").filetype_extend("python", { "pydoc" })
      require("luasnip").filetype_extend("rust", { "rustdoc" })
      require("luasnip").filetype_extend("cs", { "csharpdoc" })
      require("luasnip").filetype_extend("java", { "javadoc" })
      require("luasnip").filetype_extend("c", { "cdoc" })
      require("luasnip").filetype_extend("cpp", { "cppdoc" })
      require("luasnip").filetype_extend("php", { "phpdoc" })
      require("luasnip").filetype_extend("kotlin", { "kdoc" })
      require("luasnip").filetype_extend("ruby", { "rdoc" })
      require("luasnip").filetype_extend("sh", { "shelldoc" })
    end,
  },

-- none-ls [lsp code formatting]
  -- https://github.com/nvimtools/none-ls.nvim
  {
    "nvimtools/none-ls.nvim",
    event = "User BaseFile",
    opts = function()
      local builtin_sources = require("null-ls").builtins

      -- You can customize your 'builtin sources' and 'external sources' here.
      builtin_sources.formatting.shfmt.with({
        command = "shfmt",
        args = { "-i", "2", "-filename", "$FILENAME" },
      })

      -- Attach the user lsp mappings to every none-ls client.
      return { on_attach = utils_lsp.apply_user_lsp_mappings }
    end
  },

  --  garbage-day.nvim [lsp garbage collector]
  --  https://github.com/zeioth/garbage-day.nvim
  {
    "zeioth/garbage-day.nvim",
    event = "User BaseFile",
    opts = {
      aggressive_mode = false,
      excluded_lsp_clients = {
        "null-ls", "jdtls", "marksman", "lua_ls"
      },
      grace_period = (60 * 15),
      wakeup_delay = 3000,
      notifications = false,
      retries = 3,
      timeout = 1000,
    }
  },

  --  lazy.nvim [lua lsp for nvim plugins]
  --  https://github.com/folke/lazydev.nvim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = function(_, opts)
      opts.library = {
        -- Any plugin you wanna have LSP autocompletion for, add it here.
        -- in 'path', write the name of the plugin directory.
        -- in 'mods', write the word you use to require the module.
        -- in 'words' write words that trigger loading a lazydev path (optionally).
        { path = "lazy.nvim", mods = { "lazy" } },
        { path = "yazi.nvim", mods = { "yazi" } },
        { path = "project.nvim", mods = { "project_nvim", "telescope" } },
        { path = "trim.nvim", mods = { "trim" } },
        { path = "stickybuf.nvim", mods = { "stickybuf" } },
        { path = "mini.bufremove", mods = { "mini.bufremove" } },
        { path = "smart-splits.nvim", mods = { "smart-splits" } },
        { path = "toggleterm.nvim", mods = { "toggleterm" } },
        { path = "neovim-session-manager.nvim", mods = { "session_manager" } },
        { path = "nvim-spectre", mods = { "spectre" } },
        { path = "neo-tree.nvim", mods = { "neo-tree" } },
        { path = "nui.nvim", mods = { "nui" } },
        { path = "nvim-ufo", mods = { "ufo" } },
        { path = "promise-async", mods = { "promise-async" } },
        { path = "nvim-neoclip.lua", mods = { "neoclip", "telescope" } },
        { path = "zen-mode.nvim", mods = { "zen-mode" } },
        { path = "vim-suda", mods = { "suda" } }, -- has vimscript
        { path = "vim-matchup", mods = { "matchup", "match-up", "treesitter-matchup" } }, -- has vimscript
        { path = "hop.nvim", mods = { "hop", "hop-treesitter", "hop-yank" } },
        { path = "nvim-autopairs", mods = { "nvim-autopairs" } },
        { path = "lsp_signature", mods = { "lsp_signature" } },
        { path = "nvim-lightbulb", mods = { "nvim-lightbulb" } },
        { path = "hot-reload.nvim", mods = { "hot-reload" } },
        { path = "distroupdate.nvim", mods = { "distroupdate" } },

        { path = "tokyonight.nvim", mods = { "tokyonight" } },
        { path = "astrotheme", mods = { "astrotheme" } },
        { path = "alpha-nvim", mods = { "alpha" } },
        { path = "nvim-notify", mods = { "notify" } },
        { path = "mini.indentscope", mods = { "mini.indentscope" } },
        { path = "heirline-components.nvim", mods = { "heirline-components" } },
        { path = "telescope.nvim", mods = { "telescope" } },
        { path = "telescope-undo.nvim", mods = { "telescope", "telescope-undo" } },
        { path = "telescope-fzf-native.nvim", mods = { "telescope", "fzf_lib"  } },
        { path = "dressing.nvim", mods = { "dressing" } },
        { path = "noice.nvim", mods = { "noice", "telescope" } },
        { path = "nvim-web-devicons", mods = { "nvim-web-devicons" } },
        { path = "lspkind.nvim", mods = { "lspkind" } },
        { path = "nvim-scrollbar", mods = { "scrollbar" } },
        { path = "mini.animate", mods = { "mini.animate" } },
        { path = "highlight-undo.nvim", mods = { "highlight-undo" } },
        { path = "which-key.nvim", mods = { "which-key" } },

        { path = "nvim-treesitter", mods = { "nvim-treesitter" } },
        { path = "nvim-ts-autotag", mods = { "nvim-ts-autotag" } },
        { path = "nvim-treesitter-textobjects", mods = { "nvim-treesitter", "nvim-treesitter-textobjects" } },
        { path = "markdown.nvim", mods = { "render-markdown" } },
        { path = "nvim-highlight-colors", mods = { "nvim-highlight-colors" } },
        { path = "nvim-java", mods = { "java" } },
        { path = "nvim-lspconfig", mods = { "lspconfig" } },
        { path = "mason-lspconfig.nvim", mods = { "mason-lspconfig" } },
        { path = "mason.nvim", mods = { "mason", "mason-core", "mason-registry", "mason-vendor" } },
        { path = "mason-extra-cmds", mods = { "masonextracmds" } },
        { path = "SchemaStore.nvim", mods = { "schemastore" } },
        { path = "none-ls-autoload.nvim", mods = { "none-ls-autoload" } },
        { path = "none-ls.nvim", mods = { "null-ls" } },
        { path = "lazydev.nvim", mods = { "" } },
        { path = "garbage-day.nvim", mods = { "garbage-day" } },
        { path = "nvim-cmp", mods = { "cmp" } },
        { path = "cmp_luasnip", mods = { "cmp_luasnip" } },
        { path = "cmp-buffer", mods = { "cmp_buffer" } },
        { path = "cmp-path", mods = { "cmp_path" } },
        { path = "cmp-nvim-lsp", mods = { "cmp_nvim_lsp" } },

        { path = "LuaSnip", mods = { "luasnip" } },
        { path = "friendly-snippets", mods = { "snippets" } }, -- has vimscript
        { path = "NormalSnippets", mods = { "snippets" } }, -- has vimscript
        { path = "telescope-luasnip.nvim", mods = { "telescop" } },
        { path = "gitsigns.nvim", mods = { "gitsigns" } },
        { path = "vim-fugitive", mods = { "fugitive" } }, -- has vimscript
        { path = "aerial.nvim", mods = { "aerial", "telescope", "lualine", "resession" } },
        { path = "litee.nvim", mods = { "litee" } },
        { path = "litee-calltree.nvim", mods = { "litee" } },
        { path = "dooku.nvim", mods = { "dooku" } },
        { path = "markdown-preview.nvim", mods = { "mkdp" } }, -- has vimscript
        { path = "markmap.nvim", mods = { "markmap" } },
        { path = "neural", mods = { "neural" } },
        { path = "guess-indent.nvim", mods = { "guess-indent" } },
        { path = "compiler.nvim", mods = { "compiler" } },
        { path = "overseer.nvim", mods = { "overseer", "lualine", "neotest", "resession", "cmp_overseer" } },
        { path = "nvim-dap", mods = { "dap" } },
        { path = "nvim-nio", mods = { "nio" } },
        { path = "nvim-dap-ui", mods = { "dapui" } },
        { path = "cmp-dap", mods = { "cmp_dap" } },
        { path = "mason-nvim-dap.nvim", mods = { "mason-nvim-dap" } },

        { path = "one-small-step-for-vimkind", mods = { "osv" } },
        { path = "neotest-dart", mods = { "neotest-dart" } },
        { path = "neotest-dotnet", mods = { "neotest-dotnet" } },
        { path = "neotest-elixir", mods = { "neotest-elixir" } },
        { path = "neotest-golang", mods = { "neotest-golang" } },
        { path = "neotest-java", mods = { "neotest-java" } },
        { path = "neotest-jest", mods = { "neotest-jest" } },
        { path = "neotest-phpunit", mods = { "neotest-phpunit" } },
        { path = "neotest-python", mods = { "neotest-python" } },
        { path = "neotest-rust", mods = { "neotest-rust" } },
        { path = "neotest-zig", mods = { "neotest-zig" } },
        { path = "nvim-coverage.nvim", mods = { "coverage" } },
        { path = "gutentags_plus", mods = { "gutentags_plus" } }, -- has vimscript
        { path = "vim-gutentags", mods = { "vim-gutentags" } }, -- has vimscript

        -- To make it work exactly like neodev, you can add all plugins
        -- without conditions instead like this but it will load slower
        -- on startup and consume ~1 Gb RAM:
        -- vim.fn.stdpath "data" .. "/lazy",

        -- You can also add libs.
        { path = "luvit-meta/library", mods = { "vim%.uv" } },
      }
    end,
    specs = { { "Bilal2453/luvit-meta", lazy = true } },
  },

--  DEBUGGER ----------------------------------------------------------------
  --  Debugger alternative to vim-inspector [debugger]
  --  https://github.com/mfussenegger/nvim-dap
  --  Here we configure the adapter+config of every debugger.
  --  Debuggers don't have system dependencies, you just install them with mason.
  --  We currently ship most of them with nvim.
  {
    "mfussenegger/nvim-dap",
    enabled = vim.fn.has "win32" == 0,
    event = "User BaseFile",
    config = function()
      local dap = require("dap")

      -- C#
      dap.adapters.coreclr = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg',
        args = { '--interpreter=vscode' }
      }
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function() -- Ask the user what executable wants to debug
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Program.exe', 'file')
          end,
        },
      }

      -- F#
      dap.configurations.fsharp = dap.configurations.cs

      -- Visual basic dotnet
      dap.configurations.vb = dap.configurations.cs

      -- Java
      -- Note: The java debugger jdtls is automatically spawned and configured
      -- by the plugin 'nvim-java' in './3-dev-core.lua'.

      -- Python
      dap.adapters.python = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python',
        args = { '-m', 'debugpy.adapter' },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}", -- This configuration will launch the current file if used.
        },
      }

      -- Lua
      dap.adapters.nlua = function(callback, config)
        callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
      end
      dap.configurations.lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = "Attach to running Neovim instance",
          program = function() pcall(require "osv".launch({ port = 8086 })) end,
        }
      }

      -- C
      dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
          command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
          args = { "--port", "${port}" },
          detached = function() if is_windows then return false else return true end end,
        }
      }
      dap.configurations.c = {
        {
          name = 'Launch',
          type = 'codelldb',
          request = 'launch',
          program = function() -- Ask the user what executable wants to debug
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/program', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }

      -- C++
      dap.configurations.cpp = dap.configurations.c

      -- Rust
      dap.configurations.rust = {
        {
          name = 'Launch',
          type = 'codelldb',
          request = 'launch',
          program = function() -- Ask the user what executable wants to debug
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/program', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
          initCommands = function() -- add rust types support (optional)
            -- Find out where to look for the pretty printer Python module
            local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

            local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
            local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

            local commands = {}
            local file = io.open(commands_file, 'r')
            if file then
              for line in file:lines() do
                table.insert(commands, line)
              end
              file:close()
            end
            table.insert(commands, 1, script_import)

            return commands
          end,
        }
      }

      -- Go
      -- Requires:
      -- * You have initialized your module with 'go mod init module_name'.
      -- * You :cd your project before running DAP.
      dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
          command = vim.fn.stdpath('data') .. '/mason/packages/delve/dlv',
          args = { 'dap', '-l', '127.0.0.1:${port}' },
        }
      }
      dap.configurations.go = {
        {
          type = "delve",
          name = "Compile module and debug this file",
          request = "launch",
          program = "./${relativeFileDirname}",
        },
        {
          type = "delve",
          name = "Compile module and debug this file (test)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}"
        },
      }

      -- Dart / Flutter
      dap.adapters.dart = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter',
        args = { 'dart' }
      }
      dap.adapters.flutter = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter',
        args = { 'flutter' }
      }
      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch dart",
          dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
          flutterSdkPath = "/opt/flutter",                  -- ensure this is correct
          program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
          cwd = "${workspaceFolder}",
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
          flutterSdkPath = "/opt/flutter",                  -- ensure this is correct
          program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
          cwd = "${workspaceFolder}",
        }
      }

      -- Kotlin
      -- Kotlin projects have very weak project structure conventions.
      -- You must manually specify what the project root and main class are.
      dap.adapters.kotlin = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/bin/kotlin-debug-adapter',
      }
      dap.configurations.kotlin = {
        {
          type = 'kotlin',
          request = 'launch',
          name = 'Launch kotlin program',
          projectRoot = "${workspaceFolder}/app",     -- ensure this is correct
          mainClass = "AppKt",                        -- ensure this is correct
        },
      }

      -- Javascript / Typescript (firefox)
      dap.adapters.firefox = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/bin/firefox-debug-adapter',
      }
      dap.configurations.typescript = {
        {
          name = 'Debug with Firefox',
          type = 'firefox',
          request = 'launch',
          reAttach = true,
          url = 'http://localhost:4200', -- Write the actual URL of your project.
          webRoot = '${workspaceFolder}',
          firefoxExecutable = '/usr/bin/firefox'
        }
      }
      dap.configurations.javascript = dap.configurations.typescript
      dap.configurations.javascriptreact = dap.configurations.typescript
      dap.configurations.typescriptreact = dap.configurations.typescript

      -- Javascript / Typescript (chromium)
      -- If you prefer to use this adapter, comment the firefox one.
      -- But to use this adapter, you must manually run one of these two, first:
      -- * chromium --remote-debugging-port=9222 --user-data-dir=remote-profile
      -- * google-chrome-stable --remote-debugging-port=9222 --user-data-dir=remote-profile
      -- After starting the debugger, you must manually reload page to get all features.
      -- dap.adapters.chrome = {
      --  type = 'executable',
      --  command = vim.fn.stdpath('data')..'/mason/bin/chrome-debug-adapter',
      -- }
      -- dap.configurations.typescript = {
      --  {
      --   name = 'Debug with Chromium',
      --   type = "chrome",
      --   request = "attach",
      --   program = "${file}",
      --   cwd = vim.fn.getcwd(),
      --   sourceMaps = true,
      --   protocol = "inspector",
      --   port = 9222,
      --   webRoot = "${workspaceFolder}"
      --  }
      -- }
      -- dap.configurations.javascript = dap.configurations.typescript
      -- dap.configurations.javascriptreact = dap.configurations.typescript
      -- dap.configurations.typescriptreact = dap.configurations.typescript

      -- PHP
      dap.adapters.php = {
        type = 'executable',
        command = vim.fn.stdpath("data") .. '/mason/bin/php-debug-adapter',
      }
      dap.configurations.php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 9000
        }
      }

      -- Shell
      dap.adapters.bashdb = {
        type = 'executable',
        command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
        name = 'bashdb',
      }
      dap.configurations.sh = {
        {
          type = 'bashdb',
          request = 'launch',
          name = "Launch file",
          showDebugOutput = true,
          pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
          pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
          trace = true,
          file = "${file}",
          program = "${file}",
          cwd = '${workspaceFolder}',
          pathCat = "cat",
          pathBash = "/bin/bash",
          pathMkfifo = "mkfifo",
          pathPkill = "pkill",
          args = {},
          env = {},
          terminalKind = "integrated",
        }
      }

      -- Elixir
      dap.adapters.mix_task = {
        type = 'executable',
        command = vim.fn.stdpath("data") .. '/mason/bin/elixir-ls-debugger',
        args = {}
      }
      dap.configurations.elixir = {
        {
          type = "mix_task",
          name = "mix test",
          task = 'test',
          taskArgs = { "--trace" },
          request = "launch",
          startApps = true, -- for Phoenix projects
          projectDir = "${workspaceFolder}",
          requireFiles = {
            "test/**/test_helper.exs",
            "test/**/*_test.exs"
          }
        },
      }
    end, -- of dap config
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "jbyuki/one-small-step-for-vimkind",
      "nvim-java/nvim-java",
    },
  },

  -- nvim-dap-ui [dap ui]
  -- https://github.com/mfussenegger/nvim-dap-ui
  -- user interface for the debugger dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    opts = { floating = { border = "rounded" } },
    config = function(_, opts)
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function(
      )
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function(
      )
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      dapui.setup(opts)
    end,
  },

-- LANGUAGE IMPROVEMENTS ----------------------------------------------------
  -- guttentags_plus [auto generate C/C++ tags]
  -- https://github.com/skywind3000/gutentags_plus
  -- This plugin is necessary for using <C-]> (go to ctag).
  {
    "skywind3000/gutentags_plus",
    ft = { "c", "cpp", "lisp" },
    dependencies = { "ludovicchabant/vim-gutentags" },
    config = function()
      -- NOTE: On vimplugins we use config instead of opts.
      vim.g.gutentags_plus_nomap = 1
      vim.g.gutentags_resolve_symlinks = 1
      vim.g.gutentags_cache_dir = vim.fn.stdpath "cache" .. "/tags"
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Auto generate C/C++ tags",
        callback = function()
          local is_c = vim.bo.filetype == "c" or vim.bo.filetype == "cpp"
          if is_c then vim.g.gutentags_enabled = 1
          else vim.g.gutentags_enabled = 0 end
        end,
      })
    end,
  },

  -- TODO Comments [Highlights todos]
	{
	  "folke/todo-comments.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  opts = {},
	  keys = {},
	},
}
