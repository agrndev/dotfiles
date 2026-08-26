return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>ff", function() require("fzf-lua").files() end },
    { "<leader>fa", function() require("fzf-lua").files({ cwd = "/" }) end },
    { "<leader>fg", function() require("fzf-lua").git_files() end },
    { "<leader>fw", function() require("fzf-lua").live_grep() end },
    { "<leader>fh", function() require("fzf-lua").helptags() end },
    { "<Tab>",      function() require("fzf-lua").buffers() end },
    { "<leader>t",  function() require("fzf-lua").colorschemes() end },
  },
}
