require 'pry'
require 'colorize'
require_relative 'messages'
require_relative 'color_generator'


class Mastermind
  include Messages
  attr_reader :secret, :guess, :num_colors, :num_pos, :count, :timer_start

  def initialize
    @count = 0
  end

  def welcome
    puts Messages.introduction
    choose
  end

  def choose
    puts Messages.choices
    user_input = gets.chomp.upcase
      if user_input.start_with?("I")
        puts Messages.instructions
        choose
      elsif user_input.start_with?("P")
        level
      elsif
      user_input.start_with?("Q")
       puts Messages.quit
      exit
    else
      choose
    end
  end

  def level
    puts Messages.difficulty
    level_choice = gets.chomp.upcase
    if level_choice.start_with?("B")
      beginner_game
    elsif level_choice.start_with?("I")
      intermediary_game
    elsif level_choice.start_with?("A")
      advanced_game
    end
  end

  def beginner_game
    puts Messages.beginner_game_start
    @secret = ColorGenerator.new.beginner_secret_sequence
    @timer_start = Time.new
    @guess = gets.chomp.upcase.strip
    until @guess == @secret
      if guess.start_with?("C")
        puts Messages.cheat(@secret)
        exit
      elsif guess.length < 4
        puts Messages.guess_too_short
        @guess = gets.chomp.upcase.strip
      elsif guess.length > 4
        puts Messages.guess_too_long_beginner
        @guess = gets.chomp.upcase.strip
      elsif guess.length == 4
        guess_sequence(guess)
        @guess = gets.chomp.upcase.strip
      end
    end
  end

  def intermediary_game
    puts Messages.intermediary_game_start
    @secret = ColorGenerator.new.intermediate_secret_sequence
    @timer_start = Time.new
    @guess = gets.chomp.upcase.strip
    until @guess == @secret
      if guess.start_with?("C")
        puts Messages.cheat(@secret)
        exit
      elsif guess.length < 6
        puts Messages.guess_too_short
        @guess = gets.chomp.upcase.strip
      elsif guess.length > 6
        puts Messages.guess_too_long_intermediate
        @guess = gets.chomp.upcase.strip
      elsif guess.length == 6
        guess_sequence(guess)
        @guess = gets.chomp.upcase.strip
      end
    end
  end

  def advanced_game
    puts Messages.advanced_game_start
    @secret = ColorGenerator.new.advanced_secret_sequence
    @timer_start = Time.new
    @guess = gets.chomp.upcase.strip
    until @guess == @secret
      if guess.start_with?("C")
        puts Messages.cheat(@secret)
        exit
      elsif guess.length < 8
        puts Messages.guess_too_short
        @guess = gets.chomp.upcase.strip
      elsif guess.length > 8
        puts Messages.guess_too_long_advanced
        @guess = gets.chomp.upcase.strip
      elsif guess.length == 8
        guess_sequence(guess)
        @guess = gets.chomp.upcase.strip
      end
    end
  end

  def guess_sequence(guess)
    @count += 1
    if guess == @secret.join
      timer_end = Time.new
      puts Messages.correct_guess(@secret, @count, @timer_start, timer_end)
      play_again?
    else
      number_of_correct_positions(guess, secret)
      number_of_correct_colors(guess, secret)
      puts "#{guess} has #{num_colors} of the correct elements with #{num_pos} in the correct positions.\nYou've taken #{count} guess(es)"
    end
  end

  def number_of_correct_positions(guess, secret)
    split_guess = guess.split("")
    @num_pos = (split_guess.zip(secret).map {|g, s| g == s}).count(true)
  end

  def number_of_correct_colors(guess, secret)
    split_guess = guess.split("")
    @num_colors = (split_guess & secret).count
  end

  def play_again?
    @count = 0
    puts Messages.play_again
    user_input = gets.chomp.upcase
    if user_input.start_with?("P")
      choose
    elsif user_input.start_with?("Q")
      puts Messages.quit
      exit
    end
  end

end

mm = Mastermind.new
mm.welcome
