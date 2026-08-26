return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<BS>"] = "actions.parent"
    }
  },
  keys = {
    { "<leader>e", "<CMD>Oil --preview<CR>" },
  },
  init = function()
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
