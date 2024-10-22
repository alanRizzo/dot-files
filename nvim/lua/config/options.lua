-- Abbreviations
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev W w")
vim.cmd('inoreabbrev ipdb __import__("ipdb").set_trace()')

local opt = vim.opt -- global/buffer/windows-scoped options

opt.clipboard = "unnamedplus" -- Copy/Paste/Cut inside/outside OS
opt.completeopt = "menuone,noinsert,noselect" -- Important
opt.expandtab = true -- Convert tabs to spaces
opt.hidden = true -- Work with several buffers
opt.ignorecase = true -- Ignorecase in search pattern
opt.lazyredraw = true -- Very lazy please
opt.number = true -- Line numbers
opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
opt.shiftwidth = 2 -- Correct level of indentation
opt.autoindent = true -- Copy identantion for current line
opt.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters
opt.sidescrolloff = 8 -- Minimal number of screen lines to keep to the left and to the right if nowrap is set
opt.termguicolors = true -- set term gui colors
opt.ttyfast = true -- Don't redraw while executing macros
-- opt.updatetime = 250 -- Nice Time
opt.wrap = false -- Display lines as one long line
vim.g.history = 1000 -- Bigger history

-- opt.hlsearch = true -- highlight all matches on previous search pattern
-- opt.cursorline = true -- highlight the current line
opt.swapfile = false -- Don't swapfile for the bufffer

opt.splitright = true
opt.tabstop = 2

-- Undofiles
vim.o.undofile = true
vim.o.undodir = vim.fn.expand(vim.fn.stdpath("data") .. "/undo//")

-- Add chars to '%'
opt.matchpairs = "(:),{:},[:],<:>,':'"

-- RipGrep needed
opt.grepprg = "rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs"
opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

-- WildIgnore Stuff
local wildignored = {
	"tags",
	"*/__pycache__/*",
	"*/env/*",
	"*.png",
	"*.jpg",
	"*.jpeg",
	"*/migrations/*",
	"*/.git/*",
}

local wildignore = ""
for i = 1, #wildignored do
	wildignore = wildignore .. wildignored[i] .. ","
end

-- Finally, set wildignore...
opt.wildignore = wildignore

-- Suffixes Stuff
-- Get a lower priority when multiple files match a wildcard
local suffixesed = {
	".class",
	".pyc",
	".feature",
	"test",
}

local suffixes = ""
for i = 1, #suffixesed do
	suffixes = suffixes .. suffixesed[i] .. ","
end

-- Finally, set suffixesed...
opt.suffixes = suffixes

-- Wil load the configuration for each file in ftplugin
vim.cmd("filetype plugin on")

---------------------------------------------------------------------
--- Providers
---------------------------------------------------------------------
local g = vim.g

-- Deactivate Perl Provider
g.loaded_perl_provider = 0
-- Deactivate Ruby Provider
g.loaded_ruby_provider = 0
-- Deactivate Python 2 Provider
g.loaded_python_provider = 0
-- Load Node Provider
g.node_host_prog = "/opt/homebrew/lib/node_modules/npm"
-- Load Python 3 Provider
g.python3_host_prog = "~/.neovim/.venv/bin/python"

-- Deactivate plugins in $RUNTIME
g.loaded_tutor = 1
g.loaded_spec = 1
g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logipat = 1
g.loaded_logiPat = 1
g.loaded_matchparen = 1
g.loaded_netrw = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_sql_completion = 1
g.loaded_syntax_completion = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.vimsyn_embed = 1
g.did_load_filetypes = 1

-- Set Shell
g.shell = "/bin/zsh"
