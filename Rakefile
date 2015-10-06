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

TMUX_DOTFILES = {
  "tmux.conf" => "~/.tmux.conf",
  "tmux.conf.osx" => "~/.tmux.conf.osx"
}

VIM_DOTFILES = {
  "vimrc" => "~/.vimrc",
  "vimrc.bundles" => "~/.vimrc.bundles"
}

namespace :install do
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
  end

  task :all => [:tmux]
end

task :default => "install:all"
