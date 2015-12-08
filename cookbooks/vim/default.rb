remote_file "/home/wara/.vimrc"
remote_file "/home/wara/.gvimrc"
remote_file "/home/wara/.editorconfig"

directory   "/home/wara/.vim"
remote_file "/home/wara/.vim/input"

define :vim_plugin, set: "bundle" do
  name, set = params[:name], params[:set]
  url = "https://github.com/#{name}.git"
  dst = "/home/wara/.vim/#{set}/#{name.sub(/^.+?\//, '')}"
  git dst do
    repository url
    not_if "test -e #{dst}"
  end
end

vim_plugin "sunaku/vim-unbundle"
vim_plugin "thinca/vim-quickrun"
vim_plugin "tyru/skk.vim"
vim_plugin "tyru/open-browser.vim"
vim_plugin "kannokanno/previm"
vim_plugin "editorconfig/editorconfig-vim"

vim_plugin "fatih/vim-go"           do set "ftbundle/go"   end
vim_plugin "hotchpotch/perldoc-vim" do set "ftbundle/perl" end
vim_plugin "mattn/emmet-vim"        do set "ftbundle/html" end
vim_plugin "othree/html5.vim"       do set "ftbundle/html" end
