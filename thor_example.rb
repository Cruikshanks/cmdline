#!/usr/bin/env ruby
require 'thor'

# Thor example
class ThorExample < Thor
  # desc defines command name and long description.
  desc 'start', 'start server'
  # method_option defines an option parser for this command.
  method_option :environment, default: 'development', aliases: '-e', desc: 'which environment you want server run.'
  method_option :daemon, type: :boolean, default: false, aliases: '-d', desc: 'running on daemon mode?'
  def start
    puts "start #{options.inspect}"
  end

  desc 'stop', 'stop server'
  method_option :delay, default: 0, aliases: '-w', desc: "wait server finish it's job"
  def stop
    puts "stop #{options.inspect}"
  end
end

# ThorExample.start is a method to start parsing arguments. When you execute
# it without arguments you get details about all the commands
ThorExample.start
