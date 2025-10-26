-- [[ General Settings ]]

-- Use Nerd Font if available
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true

-- Don’t show mode (since statusline already has it)
vim.o.showmode = false

-- Clipboard: share with system
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation
vim.o.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Undo history
vim.o.undofile = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'split'

-- UI
vim.o.signcolumn = 'yes:2'
vim.o.cursorline = true
vim.o.scrolloff = 5
vim.o.confirm = true -- ask to save on quit instead of erroring

-- Performance
vim.o.updatetime = 250
vim.o.timeoutlen = 400

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace display
vim.opt.list = false

-- File handling
vim.opt.autoread = true
vim.opt.swapfile = false

-- Spell check
-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

-- tree sitter folding
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
