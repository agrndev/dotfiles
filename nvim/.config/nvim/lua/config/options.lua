--------------------------------------------
-- General
--------------------------------------------
vim.o.mouse =
'a'                                                                                                    -- Enables mouse mode

vim.o.undofile = true                                                                                  -- Enable undo/redo changes even after closing and reopening a file
vim.api.nvim_create_autocmd('UIEnter', { callback = function() vim.o.clipboard = 'unnamedplus' end, }) -- Set yank to clipboard configuration
vim.o.confirm        = true                                                                            -- Show a dialog to save current file when performing an operation

--------------------------------------------
-- Navigation
--------------------------------------------
vim.o.number         = true -- Show line numbers in a column.
vim.o.relativenumber = true -- Enable relative line numbers

vim.o.scrolloff      = 10   -- Minimal number of lines above/below the cursor.
vim.o.sidescrolloff  = 10   -- Minimal number of colums left/right of the cursor.

--------------------------------------------
-- Indentation
--------------------------------------------
vim.opt.tabstop      = 2    -- Insert 2 spaces for a tab
vim.opt.softtabstop  = 2    -- Insert 2 spaces for a tab
vim.opt.shiftwidth   = 2    -- Indent by 2 spaces
vim.opt.expandtab    = true -- Convert tabs to spaces

vim.opt.smartindent  = true -- Auto adjust indentation of new lines
vim.opt.autoindent   = true -- Copy indentation of the current line when creating a new line
vim.o.breakindent    = true -- Enable break indent

--------------------------------------------
-- Search
--------------------------------------------
vim.o.ignorecase     = true    -- Case-insensitive searching
vim.o.smartcase      = true    -- Case-sensitive when having capital letters

vim.opt.incsearch    = true    -- Preview searching live
vim.o.inccommand     = 'split' -- Preview substitutions live

--------------------------------------------
-- UI
--------------------------------------------
vim.o.background     = "dark"        -- Set background color
vim.o.cursorline     = true          -- Highlight cursor's current line
vim.opt.fillchars    = { eob = " " } -- Hide "~" character on empty lines
vim.o.laststatus     = 3             -- Set one status line for all buffers
vim.o.cmdheight      = 0             -- Hides default command line space
vim.o.splitright     = true          -- Always open tabs on the right when vertical splitting
vim.o.splitbelow     = true          -- Always open tabs below when horizontally splitting
vim.cmd("colorscheme catppuccin")

--------------------------------------------
-- Whitespace
--------------------------------------------
vim.o.list           = true -- Display whitespaces
vim.opt.listchars    = { tab = '» ', trail = '·', nbsp = '␣' } -- Substitute specific whitespaces by characters

--------------------------------------------
-- Diagnostics 
--------------------------------------------
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  virtual_text = true,   -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float{
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

--------------------------------------------
-- Netrw
--------------------------------------------
vim.g.netrw_winsize = 20                -- Set netrw width 
vim.g.netrw_banner = 0                  -- Disables netwrw banner
vim.g.netrw_keepdir = 0                 -- Keeps the current directory and the browsing directory synced. This helps you avoid the move files error.
vim.g.netrw_sort_sequence = [[[\/]$,*]] -- Shows directories first (sorting)
vim.g.netrw_sizestyle = "H"             -- Human-readable files sizes
vim.g.netrw_liststyle = 3               -- Tree style listing
vim.g.netrw_preview = 1                 -- Preview files in a vertical split window
vim.g.netrw_hide = 1                    -- Show not-hidden files
vim.g.netrw_localcopydircmd='cp -r'     -- Set copy directory command
