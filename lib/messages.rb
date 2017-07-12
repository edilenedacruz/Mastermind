module Messages

  def self.introduction
    "+-+-+-+-+-+-+-+-+-+-+
|M|a|s|t|e|r|m|i|n|d|
+-+-+-+-+-+-+-+-+-+-+".colorize(:green)
  end

  def self.choices
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n".colorize(:blue)
  end

  def self.instructions
    "The goal of the game is to correctly guess the sequence of colors that will randomly be created by the computer.\nYou will receive feedback confirming how many elements you guessed correctly and how many positions were correct.".colorize(:yellow)
  end

  def self.difficulty
    "You can choose a (b)eginner game with 4 colors, (i)ntermediary with 6 colors or (a)dvanced with 8 colors:".colorize(:blue)
  end

  def self.beginner_game_start
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game or (c) to get the secret sequence and end the game. What's your guess?"
  end

  def self.intermediary_game_start
    "I have generated an intermediate sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (p)ink and (v)iolet. Use (q)uit at any time to end the game or (c) to get the secret sequence and end the game. What's your guess?"
  end

  def self.advanced_game_start
    "I have generated an advanced sequence with eight elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (p)ink, (v)iolet, (o)range and (a)qua. Use (q)uit at any time to end the game or (c) to get the secret sequence and end the game. What's your guess?"
  end

  def self.quit
    "Giving up so soon? That's a shame!"
  end

  def self.cheat(secret)
    "I can't believe you are going to cheat! Here's the correct answer: #{secret.join}".colorize(:red)
  end

  def self.guess_too_short
    "Your guess is too short. Please try again."
  end

  def self.guess_too_long_beginner
    "Your guess is too long. Please enter only 4 colors."
  end

  def self.guess_too_long_intermediate
    "Your guess is too long. Please enter only 6 colors."
  end
  def self.guess_too_long_advanced
    "Your guess is too long. Please enter only 8 colors."
  end

  def self.correct_guess(secret, count, timer_start, timer_end)
    total = timer_end - timer_start
    minutes = Time.at(total).utc.strftime("%M:%S").split(":")[0]
    seconds = Time.at(total).utc.strftime("%M:%S").split(":")[-1]
    "Congratulations! You guessed the sequence #{secret.join.upcase} in #{count} guesses over #{minutes} minutes, #{seconds} seconds.".colorize(:green)
  end

  def self.play_again
    "Do you want to (p)lay again or (q)uit?"
  end

end
