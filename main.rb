require_relative "players"
require_relative "questions"

print "Please input player1's name: "
player1_name = $stdin.gets.chomp

print "Please input player2's name: "
player2_name = $stdin.gets.chomp

#create player1 object
player1 = Players.new(player1_name)

#create player2 object
player2 = Players.new(player2_name)

#initialize current_player to player 1
current_player = 1
while(player1.game_over && player2.game_over) do
  #current_player alters between 0 (player2) and 1 (player1)
  player = (current_player == 1) ? player1 : player2
  question = Questions.new
  puts "----- NEW TURN -----"
  puts "#{player.name}: #{question.display}"
  input_answer = $stdin.gets.chomp.to_i

  if input_answer == question.answer
    puts "YES! You are correct."
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
  else
    player.lives -= 1
    puts "Seriously? No!"
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
  end

  #below code is used to set current_player to 0 and change to player 2
  current_player = (current_player + 1) % 2

end

if player1.lives == 0
  puts "Player 2 wins with a score of #{player2.lives}/3"
elsif player2.lives == 0
  puts "Player 1 wins with a score of #{player1.lives}/3"
end

puts "----- GAME OVER -----"
puts "Good bye!"