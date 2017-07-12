require_relative 'test_helper'
require './lib/color_generator'

class ColorGeneratorTest < Minitest::Test
  attr_reader :cg
  def setup
    @cg = ColorGenerator.new
  end

  def test_beginner_sequence_has_four_colors
    assert_equal 4, cg.beginner_secret_sequence.length
  end

  def test_intermediary_sequence_has_four_colors
    assert_equal 6, cg.intermediate_secret_sequence.length
  end

  def test_advanced_sequence_has_four_colors
    assert_equal 8, cg.advanced_secret_sequence.length
  end

  def test_secret_sequence_is_always_random
    beginner_1 = ColorGenerator.new.beginner_secret_sequence
    beginner_2 = ColorGenerator.new.beginner_secret_sequence
    intermediate_1 = ColorGenerator.new.intermediate_secret_sequence
    intermediate_2 = ColorGenerator.new.intermediate_secret_sequence
    advanced_1 = ColorGenerator.new.advanced_secret_sequence
    advanced_2 = ColorGenerator.new.advanced_secret_sequence
    refute beginner_1 == beginner_2
    refute intermediate_1 == intermediate_2
    refute advanced_1 == advanced_2
  end
end
