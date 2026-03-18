# althread.nvim

Neovim plugin for the Althread language.

## Features

- Filetype detection for `.alt` and `.althread`
- Syntax highlighting
- Bundled colorscheme: `althread_night`
- Simple Lua setup API

## Installation

### lazy.nvim

```lua
{
  "tcyla/althread-vim",
  config = function()
    require("althread").setup({
      filetype = true,
      colorscheme = "althread_night",
    })
  end,
}
```

### packer.nvim

```lua
use {
  "tcyla/althread-vim",
  config = function()
    require("althread").setup({
      filetype = true,
      colorscheme = "althread_night",
    })
  end,
}
```

## Manual usage

```vim
:colorscheme althread_night
```

or

```vim
:AlthreadNight
```

## Layout

- `syntax/althread.vim`
- `ftdetect/althread.vim`
- `ftplugin/althread.vim`
- `colors/althread_night.vim`
- `plugin/althread.vim`
- `lua/althread/init.lua`
