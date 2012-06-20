# encoding: utf-8

require 'rake'

namespace :tmux do
  desc 'build the OSX pasteboard wrapper'
  task :build_pasteboard_wrapper do
    Dir.chdir('utils/tmux-MacOSX-pasteboard') do
      puts `make reattach-to-user-namespace`
      puts `cp reattach-to-user-namespace ../../bin`
    end
  end
  desc 'clean the OSX pasteboard wrapper'
  task :clean_pasteboard_wrapper do
    Dir.chdir('utils/tmux-MacOSX-pasteboard') do
      puts `rm -rf reattach-to-user-namespace reattach-to-user-namespace.o msg.o`
    end
    puts `rm -rf bin/reattach-to-user-namespace`
  end
end

