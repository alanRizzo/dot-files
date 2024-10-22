<div align="center">
  <img width="1430" alt="Captura de pantalla 2024-10-21 a la(s) 10 10 21" src="https://github.com/user-attachments/assets/6c8cd2e1-c966-4f95-8db4-800362705c1e">
  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/alanRizzo/dot-files?style=for-the-badge">
  <img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/alanRizzo/dot-files?style=for-the-badge">
  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/alanRizzo/dot-files?style=for-the-badge">
  <img alt="Neovim Minimum Version" src="https://img.shields.io/badge/Neovim-0.9.0+-blueviolet.svg?style=for-the-badge&logo=Neovim">
  <br>
  <p>:boat: My Neovim setup :boat:</p>
</div>

## Index

- [About](#about)
- [Quickstart](#quickstart)
- [Mappings](#mappings)
- [Structure](#structure)
- [Additional Features](#additional-features)

## About

This configuration is Python :snake: development oriented

## Quickstart

Install ripgrep and fd for Telescope

```zsh
brew install ripgrep fd
```

To install a LSP/DAP/Linter/Formater run:

```zsh
:Mason
```

## Python Virtualenv

If you plan to use per-project virtualenvs often, you should assign one virtualenv for 
Nvim and hard-code the interpreter path via g:python3_host_prog so that the "pynvim" 
package is not required for each virtualenv.

Example using uv:

```zsh
mkdir ~/.neovim

uv venv --python {Specify the latest Python3 version}
source .venv/bin/activate

uv pip install pynvim

which python  # Note the path
```
The last command reports the interpreter path, add it to your init.vim:

```lua
let g:python3_host_prog = '/path/to/neovim/bin/python'
```

More info: 
- https://neovim.io/doc/user/provider.html
- https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim


## Mappings

Leader key: <kbd>'</kbd>

<kbd>ESCAPE</kbd> alternative: <kbd>ctrl</kbd> <kbd>c</kbd>

| Mapping                        | Mode   | Actions                               |
| :----------------------------  | :----- | :------------------------------------ |
| <kbd>ctrl</kbd><kbd>n</kbd>    | normal | Toggle Explorer                       |
| <kbd>shift</kbd><kbd>l</kbd>   | normal | Jump to next buffer                   |
| <kbd>shift</kbd><kbd>h</kbd>   | normal | Jump to last buffer                   |
| <kbd>shift</kbd><kbd>d</kbd>   | normal | Delete current buffer                 |
| <kbd>tt</kbd>                  | normal | Duplicate current line                |
| <kbd>gd</kbd>                  | normal | Jump to Definition                    |
| <kbd>gr</kbd>                  | normal | Jump to References                    |
| <kbd>space</kbd><kbd>f</kbd>   | normal | Fuzzy Find Files                      |
| <kbd>space</kbd><kbd>w</kbd>   | normal | Fuzzy Find Words                      |
| <kbd>space</kbd><kbd>u</kbd>   | normal | Fuzzy Find Under cursor Word          |
| <kbd>space</kbd><kbd>s</kbd>   | normal | Fuzzy Find Behave Step :construction: |
| <kbd>leader</kbd><kbd>f</kbd>  | normal | Jump to word                          |
| <kbd>leader</kbd><kbd>rn</kbd> | normal | Rename word                           |
| <kbd>esc</kbd>                 | normal | Turn off search highlighting          |

Windows:

| Mapping                         | Mode   | Actions                |
| :------------------------------ | :----- | :--------------------- |
| <kbd>ctrl</kbd><kbd>h</kbd>     | normal | Go to the left window  |
| <kbd>ctrl</kbd><kbd>l</kbd>     | normal | Go to the right window |
| <kbd>ctrl</kbd><kbd>j</kbd>     | normal | Go to the down window  |
| <kbd>ctrl</kbd><kbd>k</kbd>     | normal | Go to the up window    |
| <kbd>alt</kbd><kbd>h</kbd>      | normal | Resize -2%             |
| <kbd>alt</kbd><kbd>l</kbd>      | normal | Resize +2%             |
| <kbd>alt</kbd><kbd>j</kbd>      | normal | Vertical Resize -2%    |
| <kbd>alt</kbd><kbd>k</kbd>      | normal | Vertical Resize +2%    |

All this mappings are defined in [`mappings.lua`](./lua/config/keymaps.lua).

## Structure

```markdown
.
├── README.md
├── init.lua
└── lua
    ├── config
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins
        ├── code
        │   ├── cmp.lua
        │   ├── formatter.lua
        │   └── gitsigns.lua
        ├── lsp
        │   ├── lsp-zero.lua
        │   ├── mason.lua
        │   ├── nvim-lspconfig.lua
        │   └── settings
        │       ├── _basedpyright.lua
        │       ├── _cucumber.lua
        │       ├── _lua_ls.lua
        │       └── _ruff.lua
        └── ui
            ├── alpha.lua
            ├── bufferline.lua
            ├── catppucin.lua
            ├── lualine.lua
            ├── mini-icons.lua
            ├── telescope.lua
            ├── treesitter.lua
            └── yazi.lua
```
