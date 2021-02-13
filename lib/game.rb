class Game

  attr_reader :turn, :message

  def initialize
    @turn = Turn.new
    @message = Message.new
    @turn_number = 0
  end

  def start
    game_begins
    puts @message.end_game
  end

  def game_begins
    until game_end_conditions
     
    end
  end

  [1,2,4,3] == [1,2,3,4]

  # .each_with_index
  # if [].include? == [].include? 
  # compare

  def we_play
  # if
  end

  def game_end_conditions
    @turn_number == 100 || @turn.has_won?
    #user_wants_to_quit
  end

  # def user_wants_to_quit
  #   @turn.user_input(@turn.guess) == "q" || @turn.user_input(@turn.guess) == "Q" || @turn.user_input(@turn.guess) == "quit"
  # end

  def game_end_message
    "Congratluations. Have a nice day"
  end

  def player_chooses_to_start_quit_or_read_instructions(answer)
    if answer == "q"
      puts message.quit
      return 0
    elsif answer == "i"
      puts message.instructions
    elsif answer == "p"
      puts message.lets_play
      start
    else
      puts message.abracadabra
    end
  end
end
