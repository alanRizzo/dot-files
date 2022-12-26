<div align="center">
  <pre>
   █████╗ ██╗      █████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗
  ██╔══██╗██║     ██╔══██╗████╗  ██║██║   ██║██║████╗ ████║
  ███████║██║     ███████║██╔██╗ ██║██║   ██║██║██╔████╔██║
  ██╔══██║██║     ██╔══██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║  ██║███████╗██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
  </pre>
  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/alanRizzo/dot-files?style=for-the-badge">
  <img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/alanRizzo/dot-files?style=for-the-badge">
  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/alanRizzo/dot-files?style=for-the-badge">
  <img alt="Neovim Minimum Version" src="https://img.shields.io/badge/Neovim-0.6.0+-blueviolet.svg?style=for-the-badge&logo=Neovim">
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

This configuration is oriented for Python :snake: development

## Quickstart

Clone the repo to get the configuration

```bash
git clone --depth 1 https://github.com/alan-rizzo/dotfiles ~/.config/nvim
```

If you are using zsh paste this in your .zshrc config file


```zsh
function nvimvenv {
  if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
    source "$VIRTUAL_ENV/bin/activate"
    command nvim $@
    deactivate
  else
    command nvim $@
  fi
}

alias vim=nvimvenv
```

After that install ripgrep and fd for Telescope

```zsh
brew install ripgrep fd
```

To install a LSP/DAP/Linter/Formater run:

```bash
:Mason
```

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
| <kbd>leader</kbd><kbd>md</kbd> | normal | Markdown preview                      |
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

All this mappings are defined in [`mappings.lua`](./general/mappings.lua).
Shortcut to open it faster: <kbd>leader</kbd><kbd>m</kbd>

## Structure

```markdown
$HOME/.config/nvim
├── lua: General Configuration
│ ├── aesthetic
│ │ ├── _bufferline.lua
│ │ ├── _catpuccin.lua
│ │ ├── _dashboard.lua
│ │ ├── _lualine.lua
│ │ ├── _nvim-tree.lua
│ │ └── init.lua
│ ├── general
│ │ ├── common.lua
│ │ ├── mappings.lua
│ │ ├── providers.lua
│ │ └── init.lua
│ ├── lsp
│ │ ├── settings
│ │ │ ├── pylsp.lua
│ │ │ └── sumneko_lua.lua
│ │ ├── _lsp_setup.lua
│ │ └── init.lua
│ ├── _cmp.lua
│ ├── _formatter.lua
│ ├── _gitsigns.lua
│ ├── _telescope.lua
│ └── packages.lua
└── init.lua
```

## Additional features

- Whick key popup via [which-key](https://github.com/folke/which-key.nvim)
- Default theme via [tokyonight](https://github.com/marko-cerovac/material.nvim)
- Enhanced syntax highlighting via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Dashboard via [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
- Statusline via [lualine](https://github.com/nvim-lualine/lualine.nvim)
- Explore files via [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- Fuzzy finder via [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Debugging via [vim-test](https://github.com/vim-test/vim-test)
- Auto LSP installation via [nvim-lsp-installer](https://github.comwilliamboman/nvim-lsp-installer)
- Autocompletion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Snippet support via [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- Buffer management via [bufdel](https://github.com/rmagatti/ojroques/nvim-bufdel)
- Git support via [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
