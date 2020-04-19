require 'io/console'
screen_size = IO.console.winsize
screen_height =  screen_size[0]
screen_width =  screen_size[1]
cell_size = 3
if screen_height < ((cell_size * 3) + 2)
  cell_size = ((screen_height / 2) - 2) / 3
end
if screen_width < ((cell_size * 3 * 2) + 2)
  cell_size = ((screen_width / 2) - 2) / 6
end
if screen_height < ((cell_size * 3) + 2)
  cell_size = ((screen_height / 2) - 2) / 3
end
top = (screen_height - ((cell_size * 3) + 2)) / 2
left = (screen_width - ((cell_size * 3 * 2) + 2)) / 2
# loop do
#   system("clear")
#   puts "Enter key"
#   input = gets.chomp
#   break if input.downcase == "z"
# end
system("clear")
padding = String.new(" " * left)
cell_space = String.new(" " * cell_size * 2)
cell_separator = String.new("\u2500" * cell_size * 2)
vertical = "\u2502"
cross = "\u253c"
grid_row = padding + cell_space + vertical + cell_space + vertical + cell_space
grid_separator = padding + cell_separator + cross + cell_separator + cross + cell_separator
prompt = "Enter cell number to check"
prompt_padding = [(screen_width - prompt.size) / 2, 0].max

# puts "Game is Over"
# puts "\u2570\u2571\u2572\u2573\u2574\u2575\u2576\u2577\u2578\u2579\u257a\u257b\u257c\u257d\u257e\u257f"
# puts "   \u2502\   \u2502\   "
# puts "\u2500\u2500\u2500\u253c\u2500\u2500\u2500\u253c\u2500\u2500\u2500"
# checkmark = "\u2713"
# puts checkmark

# top.times { puts}
3.times { puts}
cell_size.times { puts grid_row }
puts grid_separator
cell_size.times { puts grid_row }
puts grid_separator
cell_size.times { puts grid_row }

puts
puts
puts String.new(" " * prompt_padding) + prompt
puts
print " " * ((screen_width / 2) - 1)
gets.chomp


