----------------------------------------------------
-- General
----------------------------------------------------
vim.g.mapleader = " "      -- Sets leader key to <space>
vim.g.maplocalleader = " " -- Sets local leader key to <space>

----------------------------------------------------
-- Editor
----------------------------------------------------
vim.keymap.set("n", "<leader>e", "<cmd>:Ex<CR>", { silent = true }) -- Opens the file explorer

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")                    -- Split window vertically
vim.keymap.set("n", "<leader>sh", ":split<CR>")                     -- Split window horizontally

----------------------------------------------------
-- Navigation
----------------------------------------------------
vim.keymap.set("n", "j", function() return vim.v.count == 0 and "gj" or "j" end, { expr = true, silent = true }) -- Move down in wrapped text
vim.keymap.set("n", "k", function() return vim.v.count == 0 and "gk" or "k" end, { expr = true, silent = true }) -- Move up in wrapped text

vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')                                                       -- Move focus to the left window
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')                                                       -- Move focus to the lower window
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')                                                       -- Move focus to the upper window
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')                                                       -- Move focus to the right window
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')                                                                       -- Move focus to the left window
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')                                                                       -- Move focus to the lower window
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')                                                                       -- Move focus to the upper window
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')                                                                       -- Move focus to the right window

vim.keymap.set("i", "<C-h>", "<Left>")                                                                           -- Move cursor to the left while in insert mode
vim.keymap.set("i", "<C-k>", "<Up>")                                                                             -- Move cursor up while in insert mode
vim.keymap.set("i", "<C-l>", "<Right>")                                                                          -- Move cursor to the right while in insert mode
vim.keymap.set("i", "<C-j>", "<Down>")                                                                           -- Move cursor down while in insert mode

vim.keymap.set("v", "<C-j>", ":silent m '>+1<CR>gv=gv")                                                          -- Move visual selected block down
vim.keymap.set("v", "<C-k>", ":silent m '<-2<CR>gv=gv")                                                          -- Move visual selected block up

vim.keymap.set("v", "<", "<gv")                                                                                  -- Indent left and reselect
vim.keymap.set("v", ">", ">gv")                                                                                  -- Indent right and reselect

vim.keymap.set("n", "<C-d>", "<C-d>zz")                                                                          -- Centers screen when scrolling page downward
vim.keymap.set("n", "<C-u>", "<C-u>zz")                                                                          -- Centers screen when scrolling page upward

vim.keymap.set("n", "n", "nzzzv")                                                                                -- Centers screen when navigating to next searched word
vim.keymap.set("n", "N", "Nzzzv")                                                                                -- Centers screen when navigating to previous searched words

vim.keymap.set("x", "<leader>p", [["_dP]])                                                                       -- Paste without overwritting the yanked text
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d')                                                                 -- Delete without overwritting the yanked text

vim.keymap.set("n", "<Up>", "<Nop>")                                                                             -- Unbinding Up arrow key
vim.keymap.set("n", "<Down>", "<Nop>")                                                                           -- Unbinding Down arrow key
vim.keymap.set("n", "<Left>", "<Nop>")                                                                           -- Unbinding Left arrow key
vim.keymap.set("n", "<Right>", "<Nop>")                                                                          -- Unbinding Right arrow key

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')                                                                      -- Exit terminal mode

----------------------------------------------------
-- Diagnostics
----------------------------------------------------
-- Toggle/focus on quick fix list
vim.keymap.set("n", "<leader>q", function()
  local is_quickfix_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      is_quickfix_open = true
      break
    end
  end

  if not is_quickfix_open then
    vim.diagnostic.setqflist()
  end

  vim.cmd("copen")
  vim.cmd("wincmd J")
end, { silent = true })

----------------------------------------------------
-- Utilities
----------------------------------------------------
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- Makes file executable

vim.keymap.set("n", "<leader>/", "gcc", { remap = true }) -- Comment/uncomment selected line
vim.keymap.set("v", "<leader>/", "gc", { remap = true })  -- Comment/uncomment selected block

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clears highlights of searched words

----------------------------------------------------
-- Terminal apps
----------------------------------------------------
vim.keymap.set("n", "<leader>lg", function() require("helpers.terminal_app").floating_terminal_app("lazygit")    end) -- Opens lazygit in a floating window 
vim.keymap.set("n", "<leader>ld", function() require("helpers.terminal_app").floating_terminal_app("lazydocker") end) -- Opens lazydocker in a floating window

vim.keymap.set("n", "<C-t>", "<cmd>silent !tmux neww<CR>") -- Creates a new tmux tab
