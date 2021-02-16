require "simplecov"

SimpleCov.start do
  add_filter "lib/game.rb"
  add_filter "lib/message_module.rb"
end

require 'minitest/autorun'
require 'minitest/pride'
require 'colorize'
require './lib/codemaker'
require './lib/turn'
require './lib/message_module'
require './lib/game'
