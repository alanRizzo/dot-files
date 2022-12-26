-- Mapping helper
local map = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = false })
end

-- Define Mapleader
vim.g.mapleader = "'"

-- Abbreviations
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev W w")
vim.cmd('inoreabbrev ipdb __import__("ipdb").set_trace()')

-- Edit mapping faster
map("n", "<Leader>m", ":vsplit ~/.config/nvim/lua/general/mappings.lua<CR>")

-- Reload file
map("n", "<Leader>s", ":source %<CR>")

-- Identation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Duplitcate Line
map("n", "tt", ":t.<CR>")

-- use ESC to turn off search highlighting
map("n", "<Esc>", ":noh<CR>")

-- Resize with arrows
map("n", "<M-j>", ":resize -2<CR>")
map("n", "<M-k>", ":resize +2<CR>")
map("n", "<M-h>", ":vertical resize -2<CR>")
map("n", "<M-l>", ":vertical resize +2<CR>")

-- Tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Move between buffers
map("n", "<S-l>", ":BufferLineCycleNext<CR>")
map("n", "<S-h>", ":BufferLineCyclePrev<CR>")
map("n", "<S-d>", ":BufDel<CR>")
