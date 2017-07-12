require_relative 'test_helper'
require './lib/messages'

class MessagesTest < Minitest::Test

  def test_it_can_print_welcome_phrase
    assert Messages.introduction.include?("+-+")
  end

  def test_it_can_print_choices
    assert Messages.choices.include?("Would you like to (p)lay")
  end

  def test_instructions
    assert Messages.instructions.include?("The goal of the game")
  end

  def test_difficulties_options_beginner
    assert Messages.difficulty.include?("(b)eginner")
  end

  def test_difficulties_options_intermediate
    assert Messages.difficulty.include?("(i)ntermediary")
  end

  def test_difficulties_options_advanced
    assert Messages.difficulty.include?("(a)dvanced")
  end

  def test_beginner_start
    assert Messages.beginner_game_start.include?("with four elements")
  end

  def test_intermediate_start
    assert Messages.intermediary_game_start.include?("with six elements")
  end

  def test_advanced_start
    assert Messages.advanced_game_start.include?("with eight elements")
  end

  def test_guess_too_short_message
    assert Messages.guess_too_short.include?("Your guess is too short.")
  end

  def test_guess_too_long_beginner
    assert Messages.guess_too_long_beginner.include?("Please enter only 4 colors.")
  end

  def test_guess_too_long_intermediate
    assert Messages.guess_too_long_intermediate.include?("Please enter only 6 colors.")
  end

  def test_guess_too_long_advanced
    assert Messages.guess_too_long_advanced.include?("Please enter only 8 colors.")
  end

  def test_correct_guess
    secret = ["R", "R", "R", "R"]
    count = "5"
    timer_start = Time.now
    timer_end = Time.now
    assert Messages.correct_guess(secret, count, timer_start, timer_end).include?("Congratulations!")
  end

  def test_play_again
    assert Messages.play_again.include?("Do you want to (p)lay again")
  end
end
