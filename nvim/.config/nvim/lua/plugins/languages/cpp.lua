return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
      vim.lsp.config("clangd", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        cmd = {
          "clangd",
          "--background-index",
          "--log=verbose",
          "--clang-tidy",
          "--header-insertion=iwyu",
        },
        filetypes = { "c", "cpp" },
        root_markers = {
          ".clangd",
          ".clang-format",
          "Makefile",
          ".git",
        },
      })

      vim.lsp.enable("clangd")
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "clangd",
        "clang-format",
        "codelldb",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      require("nvim-treesitter").install({
        "c",
        "cpp",
        "make",
        "cmake"
      })
    end
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
         c = { "clang-format" },
         cpp = { "clang-format" },
         cmake = { "cmake-format" },
      }
    }
  },
  {
    "mfussenegger/nvim-dap",
    ft = { "c", "cpp" },
    config = function()
      local dap = require("dap")
      local codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_path,
          args    = { "--port", "${port}" },
        },
      }

      local cpp_config = {
        {
          name    = "Launch (codelldb)",
          type    = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd         = "${workspaceFolder}",
          stopOnEntry = false,
          args = function()
            local raw = vim.fn.input("Args (space-separated): ")
            if raw == "" then return {} end
            return vim.split(raw, " ", { trimempty = true })
          end,
        },
        {
          name    = "Attach to process",
          type    = "codelldb",
          request = "attach",
          pid     = require("dap.utils").pick_process,
          cwd     = "${workspaceFolder}",
        },
      }

      dap.configurations.cpp = cpp_config
      dap.configurations.c   = cpp_config

    end
  }
}
