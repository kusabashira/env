command! -bar -complete=file -nargs=*
\ QArgs  :let g:quickrun_config['_'].args = join([<f-args>], ' ')
command! -bar
\ QInput :5sp ~/.vim/input

let mapleader=' '
nnoremap <silent><leader>r :<C-u>call QuickRun()<cr>

augroup ftconfig
  autocmd!
  autocmd FileType *
  \ setlocal ts=2 sw=2 sts=2 et
  autocmd FileType perl,python
  \ setlocal ts=4 sw=4 sts=4 et
  autocmd FileType c,go,make
  \ setlocal ts=8 sw=8 sts=8 noet
augroup END

let g:quickrun_config={
\   '_' : {
\     'input': expand('~/.vim/input'),
\     'outputter/buffer/split': ':belowright 40vs',
\   },
\   'javascript' : {
\     'command': 'node',
\   },
\   'python' : {
\     'command': 'python3',
\   },
\ }
let g:skk_auto_save_jisyo=1
let g:skk_large_jisyo='/usr/share/skk/SKK-JISYO.L'
let g:go_highlight_trailing_whitespace_error=0

if has('vim_starting')
  function! QuickRun()
    if filewritable(expand("%:p")) | write | endif
    QuickRun
  endfunction

  runtime bundle/vim-unbundle/plugin/unbundle.vim
  syntax on
  filetype plugin indent on
endif
