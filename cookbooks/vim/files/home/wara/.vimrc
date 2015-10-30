set all&

command! -bar -complete=file -nargs=*
\ QArgs  :let g:quickrun_config['_'].args = join([<f-args>], ' ')
command! -bar
\ QInput :5sp ~/.vim/input

let mapleader=' '
let g:quickrun_config={
\   '_' : {
\     'input': expand('~/.vim/input'),
\     'outputter/buffer/split': ':belowright 40vs',
\   },
\ }
let g:go_highlight_trailing_whitespace_error=0
let g:EditorConfig_max_line_indicator='none'

runtime bundle/vim-unbundle/plugin/unbundle.vim
