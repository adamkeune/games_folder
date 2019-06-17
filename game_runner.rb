require_relative "Connect_4"
require_relative "Tictactoe"

puts "Let's play!"
puts "Who is the first player?"
name1 = gets.chomp
puts "#{name1}, your token is X."
puts "And who is the second player?"
name2 = gets.chomp
puts "#{name2}, your token is O"

puts "Which game would you like to play?"
puts "Enter 1 for Connect Four, or enter 2 for Tic-Tac-Toe"
response = gets.chomp

if response == "1"
  game = Connect_4.new(name1, name2)
elsif response == "2"
  game = Tictactoe.new(name1, name2)
end

puts "Alright, let the game begin! (type 'exit' at any point to end)"

game.play_game