#!/usr/bin/env ruby
require 'pry'
require 'mixlib/shellout'

# Commando-time
command = Mixlib::ShellOut.new('git log --use-mailmap').run_command.stdout

# Grep it out
arr = command.scan(/Author: (.*) </).map { |item| item[0] }

# Count it up
count = Hash[arr.group_by { |x| x }.map {|k,v| [k,v.count]}]

# Sorting
sorted = count.sort_by {|k, v| [-Integer(v), k]}

# Pretty printing
sorted.each do |author|
  printf "%7d %s\n", author[1], author[0]
end
