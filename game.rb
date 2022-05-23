# Object Oriented Version
class Hangman
  attr_reader :lives
  attr_reader :board
  attr_reader :secret_word

  def initialize()
    @lives = 7
    @secret_word = word_list.sample
    @board = setup_board
  end

  def setup_board
    ["_"] * secret_word.size
  end

  def word_list
    [
      "dog",
      "cat",
      "fast"
    ]
  end

  def start
    puts "Welcome to Hangman"
  
    while !lost? && !won?
    
      puts "\n\nYou have #{lives} lives left."
      
      puts board_state
    
      guess = make_guess
      
      update_board(guess)
    end

    if won?
      puts "You won!"
    else
      puts "You lost!"
    end
  end

  def lost?
    lives <= 0
  end

  def won?
    board.join("") == secret_word
  end

  def make_guess
    print "Please guess a letter: "
    gets.chomp
  end

  def board_state
    board.join(" ")
  end

  def update_board(guess)
    if secret_word.include?(guess)
      i = 0 
      while i < secret_word.size
        if guess.downcase == secret_word[i].downcase
          board[i] = secret_word[i]
        end
        i += 1
      end
    else
      @lives -= 1
    end
  end
end

game = Hangman.new
game.start