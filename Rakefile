task :default => [:link, :tmp_dirs]

desc %(Make ~/.vimrc and ~/.gvimrc symlinks)
task :link do
  %w[vimrc gvimrc].each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist? dotfile
      warn "~/.#{script} already exists"
    else
      ln_s File.join('.vim', script), dotfile
    end
  end
end

desc %(Create temporary directories used in vimrc)
task :tmp_dirs do
  mkdir_p "_backup"
  mkdir_p "_undo"
  mkdir_p "_tmp"
end
