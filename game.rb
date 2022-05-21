words = ["dog", "cat", "fast"]

secret_word = words.sample;
puts "The secret_word is #{secret_word}";
board = ["_"] * secret_word.size;
p board;

print "Please input your guess: ";
guess = gets.chomp;
p "Your guess is #{guess}";