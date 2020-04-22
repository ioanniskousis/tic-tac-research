require_relative 'interface'
require_relative 'game'

keep_playing  = true

while keep_playing do
  
  interface = UserInterface.setup(Game.user_moves, Game.current_player)
  
  interface.each { |line| puts line }

  user_input = gets.chomp
  if Game.check(user_input)
    status = Game.status
    if status[0] == "OVER"
      puts status
      puts "game over"
      c = gets

    end
  end

  keep_playing = user_input[0].downcase != 'z' if user_input.size.positive?
end