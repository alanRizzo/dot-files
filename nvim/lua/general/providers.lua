local g = vim.g

-- Deactivate Perl Provider
g.loaded_perl_provider = 0
-- .g.perl_host_prog = '/usr/bin/perl'

-- Deactivate Ruby Provider
g.loaded_ruby_provider = 0

-- Deactivate Python 2 Provider
g.loaded_python_provider = 0

-- Load Node Provider
g.node_host_prog = "/opt/homebrew/lib/node_modules/npm"

-- Load Python 3 Provider
g.python3_host_prog = "~/.pyenv/.venv/bin/python"

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
