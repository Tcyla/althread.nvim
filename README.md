# althread.nvim

Neovim plugin for the Althread language.

## Features

- Filetype detection for `.alt` and `.althread`
- Tree-sitter first highlighting (with Vim syntax fallback)
- Bundled colorscheme: `althread_night`
- Simple Lua setup API

## Installation

### lazy.nvim

```lua
{
  "tcyla/althread.nvim",
  config = function()
    require("althread").setup({
      filetype = true,
      treesitter = {
        enable = true,
      },
    })
  end,
}
```

### packer.nvim

```lua
use {
  "tcyla/althread.nvim",
  config = function()
    require("althread").setup({
      filetype = true,
      treesitter = {
        enable = true,
      },
    })
  end,
}
```

## Tree-sitter parser

This plugin ships queries in `queries/althread/highlights.scm`.
You still need an Althread Tree-sitter parser installed in Neovim.

If you use `nvim-treesitter`, you can pass parser config:

```lua
require("althread").setup({
  treesitter = {
    enable = true,
    parser_config = {
      install_info = {
        url = "https://github.com/your-org/tree-sitter-althread",
        files = { "src/parser.c" },
      },
      filetype = "althread",
    },
  },
})
```

Without parser, plugin falls back to `syntax/althread.vim`.

## Manual usage

```vim
:colorscheme althread_night
```

or

```vim
:AlthreadNight
```

```vim
:AlthreadTreeSitter
```

## Layout

- `syntax/althread.vim`
- `ftdetect/althread.vim`
- `ftplugin/althread.vim`
- `colors/althread_night.vim`
- `plugin/althread.vim`
- `lua/althread/init.lua`
