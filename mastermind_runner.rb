require './lib/peg'
require './lib/codemaker'
require './lib/codebreaker'
require './lib/turn'
require './lib/message'
require './lib/game'

# message = Message.new
game = Game.new
message = Message.new

puts message.introduction
game.start
