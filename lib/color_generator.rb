class ColorGenerator
  def beginner_secret_sequence
    colors = ["R", "G", "B", "Y"]
    Array.new(4, colors).flatten.sample(4)
  end

  def intermediate_secret_sequence
    colors = ["R", "G", "B", "Y", "P", "V"]
    Array.new(6, colors).flatten.sample(6)
  end

  def advanced_secret_sequence
    colors = ["R", "G", "B", "Y", "P", "V", "O", "A"]
    Array.new(8, colors).flatten.sample(8)
  end
end
