require './lib/peg'
require './lib/codemaker'
require './lib/codebreaker'
require './lib/turn'
require './lib/message'
require './lib/game'

# message = Message.new
game = Game.new
message = Message.new

message.introduction
game.start
