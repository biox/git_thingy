#!/usr/bin/env ruby

require 'mixlib/shellout'
require 'awesome_print'
require 'rubygems'
require 'commander/import'
require 'terminal-table'
require 'pry'

program :name, 'print'
program :version, '100.6.88'
program :description, 'Prints git branches prettily'

def git_cmd(command, *opts)
  Mixlib::ShellOut.new('git ' + command + " #{opts.nil? ? '' : opts.join(' ')}").run_command.stdout
end

command :basic do |c|
  c.syntax = './print.rb basic [options]'
  c.description = 'Prints basic git branch layout'
  c.option '--sort commit', String, 'sort by commit (default alphabetical)'
  c.action do |args, options|
    ap git_cmd('branch', "-a #{options.sort}").split("\n  ")
  end
end

command :table do |c|
  c.syntax = './print.rb table [options]'
  c.description = 'Prints basic git table-based layout'
  c.option '-t', 'Add tags!'
  c.action do |args, options|
  end
end

