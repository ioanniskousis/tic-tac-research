require_relative 'user_interface'
require_relative 'game'

terminate_app  = false

loop do
  
  # UserInterface.draw_grid(Game.user_moves)

  puts "Enter command - user " + Game.current_player
  user_input = gets.chomp

  terminate_app = user_input[0].downcase == 'z' if user_input.size.positive?

  break if terminate_app
end