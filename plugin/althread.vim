" Neovim/Vim plugin entrypoint for Althread

if exists('g:loaded_althread_plugin')
  finish
endif
let g:loaded_althread_plugin = 1

" Simple command to load the bundled colorscheme.
command! AlthreadNight colorscheme althread_night
command! AlthreadTreeSitter lua require('althread').setup({ treesitter = { enable = true } })
