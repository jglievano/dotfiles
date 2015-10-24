require "open3"

def step(desc)
  desc = "-- #{desc} "
  desc = desc.ljust(60, "-")
  puts
  puts "\e[32m#{desc}\e[0m"
end

def get_backup_path(path)
  number = 1
  backup_path = "#{path}.bak"
  loop do
    if number > 1
      backup_path = "#{backup_path}#{number}"
    end
    if File.exists?(backup_path) || File.symlink?(backup_path)
      number += 1
      next
    end
    break
  end
  backup_path
end

def link_file(src_filename, symlink_name)
  src_path = File.expand_path(src_filename)
  symlink_path = File.expand_path(symlink_name)
  puts "Linking #{src_path} to #{symlink_path}"
  if File.exists?(symlink_path) || File.symlink?(symlink_path)
    if File.symlink?(symlink_path)
      symlink_points_to_path = File.readlink(symlink_path)
      return if symlink_points_to_path == src_path
      ln_s symlink_points_to_path, get_backup_path(symlink_path), :verbose => true
      rm symlink_path
    else
      mv symlink_path, get_backup_path(symlink_path), :verbose => true
    end
  end
  ln_s src_path, symlink_path, :verbose => true
end

BASH_DOTFILES = {
  "bashrc" => ["~/.bashrc", "~/.bash_profile", "~/.profile"]
}

TMUX_DOTFILES = {
  "tmux.conf" => "~/.tmux.conf",
  "tmux.conf.osx" => "~/.tmux.conf.osx"
}

VIM_DOTFILES = {
  "vimrc" => "~/.vimrc",
  "vimrc.bundles" => "~/.vimrc.bundles"
}

namespace :install do
  task :bash do
    step "install bash dot files"
    BASH_DOTFILES.each do |src, dst|
      if dst.kind_of?(Array)
        dst.each do |d|
          link_file src, d
        end
      else
        link_file src, dst
      end
    end
  end

  task :tmux do
    step "install tmux dot files"
    TMUX_DOTFILES.each do |src, dst|
      link_file src, dst
    end
  end

  task :vim do
    step "install vim dot files"
    VIM_DOTFILES.each do |src, dst|
      link_file src, dst
    end
    mkdir_p File.expand_path("~/.vim")
    mkdir_p File.expand_path("~/.vim/backup")
    mkdir_p File.expand_path("~/.vim/swap")
    mkdir_p File.expand_path("~/.vim/undo")

    mkdir_p File.expand_path("~/.vim/autoload")
    plugvim_path = File.expand_path("~/.vim/autoload/plug.vim")
    plugvim_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    Open3.popen3("curl -fLo #{plugvim_path} --create-dirs #{plugvim_url}") { |stdin, stdout, stderr| }
    sh "vim +PlugUpdate +qall now"
  end

  task :all => [:bash, :tmux, :vim]
end

task :default => "install:all"
