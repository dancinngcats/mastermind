class Game

  attr_reader :turn, :message

  def initialize
    @turn = Turn.new
    @message = Message.new
    @turn_number = 0
  end

  def start
    answer = gets.chomp
    if answer.downcase == "p"
      flow
    end
    if answer.downcase == "i"
      puts @message.instructions

      until answer.downcase == "p" || answer.downcase == "q"
      instruction_prompt = gets.chomp
        if instruction_prompt.downcase == "p"
          flow
        elsif instruction_prompt.downcase == "q"
          puts @message.quit
          break
        else
          puts @message.abracadabra
        end
      end
    end
  end

  def flow
    puts @message.lets_play
    until end_conditions_are_met
      @turn.user_input(gets.chomp)
      @turn.length_message
      @turn_number += 1
        if @turn.guess != nil
          puts feedback_message
        end
        puts @message.end_game
      end
      answer = gets.chomp
        if answer == "p"
          flow
        elsif answer == "q"
          puts @message.quit
        else
          puts "fuck you - just kidding."
        end
      end
  # end



    # if @turn.won == true
    #   puts @message.end_game
    #   answer = gets.chomp
    #   if answer == "p"
    #     start
    #   end
      # until answer == "p" || answer == "q"
      #     if answer == "p"
      #       flow
      #     elsif answer == "q"
      #       puts @message.quit
      #   end
      # end

  def feedback_message
    "#{@turn.guess.to_s.upcase} has #{@turn.color_checker} of the correct elements with #{@turn.index_checker} in the correct positions you've taken #{@turn_number} guess"
  end

  def end_conditions_are_met
    @turn_number == 100 || @turn.has_won?
  end

  end
