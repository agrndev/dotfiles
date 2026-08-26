return {
  {
   "seblyng/roslyn.nvim",
   ft = { "cs" },
   dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      config = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      },
      exe = {
        "dotnet",
        vim.fn.stdpath("data") .. "/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll",
      },
      filewatching = true,
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      }
    }
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 
        "roslyn",
        "csharpier",
        "netcoredbg",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      require("nvim-treesitter").install({
        "c_sharp"
      })
    end
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
    },
  },
}
