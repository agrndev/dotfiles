---------------------------------------------------------
-- Groups
---------------------------------------------------------
local yank_group = vim.api.nvim_create_augroup("TextYank", { clear = true })

---------------------------------------------------------
-- Highlight on yank
---------------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

---------------------------------------------------------
-- (WSL) Yank directly to Window"s clipboard
---------------------------------------------------------
local clip = "/mnt/c/Windows/System32/clip.exe"

if vim.fn.executable(clip) then
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    callback = function()
      if vim.v.event.operator ~= "y" then
        return
      end
      vim.fn.system(clip, vim.fn.getreg(0))
    end
  })
end
