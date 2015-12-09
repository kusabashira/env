command! -bar -complete=file -nargs=*
\ QArgs  :let g:quickrun_config['_'].args = join([<f-args>], ' ')
command! -bar
\ QInput :5sp ~/.vim/input

let mapleader=' '
nnoremap <silent><leader>r :<C-u>call QuickRun()<cr>

let g:quickrun_config={
\   '_' : {
\     'input': expand('~/.vim/input'),
\     'outputter/buffer/split': ':belowright 40vs',
\   },
\   'javascript' : {
\     'command': 'nodejs',
\   },
\   'python' : {
\     'command': 'python3',
\   },
\ }
let g:skk_auto_save_jisyo=1
let g:skk_large_jisyo='/usr/share/skk/SKK-JISYO.L'
let g:go_highlight_trailing_whitespace_error=0
let g:EditorConfig_max_line_indicator='none'

if has('vim_starting')
  function! QuickRun()
    if filewritable(expand("%:p")) | write | endif
    QuickRun
  endfunction

  runtime bundle/vim-unbundle/plugin/unbundle.vim
  syntax on
  filetype plugin indent on
endif
