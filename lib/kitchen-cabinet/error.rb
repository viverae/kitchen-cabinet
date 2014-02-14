#!/usr/bin/env ruby
# Encoding: utf-8

# The error class responds with a helpful message whenever you do something
# that breaks kitchen-cabinet.
class Error
  def self.opt_error(message, opt_parser)
    puts ''
    puts message
    puts ''
    puts opt_parser
    exit
  end
end
