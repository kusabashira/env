remote_file "/home/wara/.bashrc"
remote_file "/home/wara/.inputrc"
remote_file "/home/wara/.gitconfig"
remote_file "/home/wara/.cdf_src" do
  not_if "test -e /home/wara/.cdf_src"
end

directory   "/home/wara/.bash"
remote_file "/home/wara/.bash/er.bash"
remote_file "/home/wara/.bash/cdr.bash"
remote_file "/home/wara/.bash/cdf.bash"
remote_file "/home/wara/.bash/cdp.bash"

directory   "/home/wara/bin"
remote_file "/home/wara/bin/baw"
remote_file "/home/wara/bin/ej"
remote_file "/home/wara/bin/je"
remote_file "/home/wara/bin/monico"
remote_file "/home/wara/bin/snip"

directory   "/home/wara/.snip"
remote_file "/home/wara/.snip/sh"
remote_file "/home/wara/.snip/pl"
remote_file "/home/wara/.snip/misc"
