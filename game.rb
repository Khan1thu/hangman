words = ["dog", "cat", "fast"]

secret_word = words.sample;
puts "The secret_word is #{secret_word}";
board = ["_"] * secret_word.size;
p board;

while lives > 0 && board.include?("_")
  print "You have #{lives} lives left. Please guess a letter: "
  guess = gets.chomp
  puts "Your guess was: #{guess}"

  if secret_word.include?(guess)
    secret_word.chars.each_with_index do |c, index|
      if c.downcase == guess.downcase
        board[index] = c
      end
    end
  else
    lives -= 1
    puts "The word did not include: #{guess}."
  end

  puts board.join(" ")
end

puts "The word was: #{ secret_word }"