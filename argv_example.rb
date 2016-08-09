#!/usr/bin/env ruby

# Though simple and with no dependencies this has some key disadvantages
# - Writing option parser and help text in different places is likely to lead
#   to mismatches
# - Having to use an array index to get options from ARGV. These 'magic numbers'
#   create a maintenance problem, and means users must enter args in a specific
#   order

def parse_options
  options = {}
  case ARGV[1]
  when '-e'
    options[:e] = ARGV[2]
  when '-d'
    options[:d] = ARGV[2]
  end
  options
end

case ARGV[0]
when 'start'
  STDOUT.puts "start on #{parse_options.inspect}"
when 'stop'
  STDOUT.puts "stop on #{parse_options.inspect}"
when 'restart'
  STDOUT.puts "restart on #{parse_options.inspect}"
else
  # This is all one block. Doing it using <<-EOF EOF means the text is output
  # exactly as seen here
  STDOUT.puts <<-EOF
Usage:
  server start
  server stop
  server restart

  options:
    -e ENVIRONMENT. Default: development
    -d DEAMON, true or false. Default: true
EOF
end
