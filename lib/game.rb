class Game

  attr_reader :turn, :message

  def initialize
    @turn = Turn.new
    @message = Message.new
    @turn_number = 0
  end

  def start
    answer = gets.chomp
    if answer == "i"
      puts @message.instructions
      until answer == "p" || answer == "q"
      instruction_prompt = gets.chomp
        if instruction_prompt == "p"
          game.flow
        elsif instruction_prompt == "q"
          puts @message.quit
          break
        else
          puts @message.abracadabra
        end
      end
    end
  end

  def flow
    until end_conditions_are_met
      @turn.user_input(gets.chomp)


      puts @message.end_game
      @turn_number += 1
    end
  end


    def end_conditions_are_met
      @turn_number == 100 || @turn.has_won? || (@turn.user_input != ("q" || "quit" || "Q"))
    end

  end
