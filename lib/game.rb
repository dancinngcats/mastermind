class Game

  attr_reader :turn

  include MessageModule

  def initialize
    @turn = Turn.new
    @turn_number = 0
  end

  def start
    introduction
    start_loop
  end

  def start_loop
    @user_input = gets.chomp.downcase
    start_menu_select
    if @user_input == "i" || @user_input == "instructions"
      until user_input_play || user_input_quit
        @user_input = gets.chomp
        if user_input_play
          flow
        elsif user_input_quit
          quit
          break
        else
          choose_play_or_quit
        end
      end
    end
  end

  def user_input_play
    @user_input.downcase == "p" || @user_input.downcase == "play"
  end

  def user_input_quit
    @user_input == "q" || @user_input == "quit"
  end

  def flow
    reset_game
    lets_play
    until end_conditions
      begin_loop
      if user_quits
        quit
        break
      end
      edge_case_for_loops
      if all_systems_go?
        all_systems_go
        if @turn.has_won?
          turn_has_won
          if user_input_play
            flow
          elsif user_input_quit
            quit
            break
          end
        end
      end
    end
  end

  def time_elapsed
    @time_end - @time_start
  end

  def interpolated_time
    seconds = time_elapsed % 60
    minutes = (time_elapsed - seconds) / 60
    "#{minutes.to_i} minutes and #{seconds.to_i} seconds"
  end

  def start_menu_select
    if user_input_play
      flow
    elsif @user_input == "i" || @user_input == "instructions"
      puts instructions
      break_it_up
    elsif user_input_quit
      quit
    else
      choose_play_or_quit
      start
    end
  end

  def begin_loop
    @turn.player_guess(gets.chomp)
    @turn_number += 1
  end

  def edge_case_for_loops
    if @turn.guess == "c" || @turn.guess == "cheat"
      cheater
      cheater_2
    elsif @turn.correct_length? == -1
      short_guess
    elsif @turn.correct_length? == 1
      long_guess
    elsif @turn.correct_characters? == false
      right_letters
    end
  end

  def all_systems_go
    reset_turn_score
    @turn.index_checker
    feedback_message
  end

  def all_systems_go?
    @turn.correct_characters? == true && @turn.correct_length? == true
  end

  def turn_has_won
    @time_end = Time.now
    end_game
    @user_input = gets.chomp
  end

  def end_conditions
    @turn_number == 100 || @turn.has_won? || user_quits
  end

  def user_quits
    @turn.guess == "q" || @turn.guess == "Q" || @turn.guess ==  "quit"
  end

  def reset_turn_score
    @turn.number_correct = 0
  end

  def reset_game
    @time_start = Time.now
    @turn.won = false
    @turn_number = 0
    @turn.number_correct = 0
    @turn = Turn.new
  end
end
