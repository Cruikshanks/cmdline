#!/usr/bin/env ruby

require 'optparse'

# OptionParser is a built-in Ruby lib to help you parse arguments.
# http://ruby-doc.org/stdlib-2.3.1/libdoc/optparse/rdoc/OptionParser.html

# The benefit of OptionParser is we don't need to use array index to retrieve
# options and we can write help text along with option definition.
# The disadvantage of OptionParser is all commands need to use the same option
# parser, so you cannot define different option parsers for different commands.

options = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = 'Usage: opt_parser COMMAND [OPTIONS]'
  opts.separator  ''
  opts.separator  'Commands'
  opts.separator  '     start: start server'
  opts.separator  '     stop: stop server'
  opts.separator  '     restart: restart server'
  opts.separator  ''
  opts.separator  'Options'

  # You can define an option's value type. OptionParser will convert the value
  # to the type you defined like below
  opts.on('-e',
          '--environment ENVIRONMENT',
          'which environment you want server run') do |environment|
    options[:environment] = environment
  end

  opts.on('-d', '--daemon', 'runing on daemon mode?') do
    options[:daemon] = true
  end

  # Mandatory argument.
  opts.on('-r',
          '--require LIBRARY',
          'Require the LIBRARY before executing your script') do |lib|
    options.library << lib
  end

  # Optional argument; multi-line description.
  opts.on('-i', '--inplace [EXTENSION]',
          'Edit ARGV files in place',
          '  (make backup if EXTENSION supplied)') do |ext|
    options.inplace = true
    options.extension = ext || ''
    options.extension.sub!(/A.?(?=.)/, '.') # Ensure extension begins with dot.
  end

  opts.on('-h', '--help', 'help') do
    puts opt_parser
  end
end

# opt_parser.parse! extracts options from ARGV destructively. There is a .parse
# version which isn't destructive
opt_parser.parse!

case ARGV[0]
when 'start'
  puts 'call start on options #{options.inspect}'
when 'stop'
  puts 'call stop on options #{options.inspect}'
when 'restart'
  puts 'call restart on options #{options.inspect}'
else
  puts opt_parser
end
