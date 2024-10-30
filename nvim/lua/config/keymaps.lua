-- Define Mapleader
vim.g.mapleader = "'"

-- Reload file
vim.keymap.set("n", "<Leader>s", ":source %<CR>", { desc = "Source file" })

-- Identation
vim.keymap.set("v", "<", "<gv", { desc = "Undentate" })
vim.keymap.set("v", ">", ">gv", { desc = "Identate" })

-- Duplitcate Line
vim.keymap.set("n", "tt", ":t.<cr>", { desc = "Duplicate line" })

-- use ESC to turn off search highlighting
vim.keymap.set("n", "<Esc>", ":noh<cr>", { desc = "Turn off highligh" })

-- Resize with arrows
vim.keymap.set("n", "<M-j>", ":resize -2<cr>", { desc = "Resize -" })
vim.keymap.set("n", "<M-k>", ":resize +2<cr>", { desc = "Resize +" })
vim.keymap.set("n", "<M-h>", ":vertical resize -2<cr>", { desc = "Resize vertical -" })
vim.keymap.set("n", "<M-l>", ":vertical resize +2<cr>", { desc = "Resize vertical +" })

-- Move between buffers
-- vim.keymap.set("n", "<s-l>", ":bn<cr>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<s-h>", ":bp<cr>", { desc = "Previous buffer" })
-- vim.keymap.set("n", "<s-d>", ":bp|bd#<cr>", { desc = "Close buffer" })

-- Move between windows
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Move to lower window" })
