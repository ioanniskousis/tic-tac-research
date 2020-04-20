require 'io/console'
SCREEN_SIZE = IO.console.winsize
$SCREEN_HEIGHT =  SCREEN_SIZE[0]
$SCREEN_WIDTH =  SCREEN_SIZE[1]

def init_cell_size(cs)
  cs = ((cs / 2 ) * 2) + 1
  if $SCREEN_HEIGHT < ((cs * 3) + 10)
    cs = (($SCREEN_HEIGHT / 2) - 10) / 3
  end
  if $SCREEN_WIDTH < ((cs * 3 * 2) + 2)
    cs = (($SCREEN_WIDTH / 2) - 2) / 6
  end
  if $SCREEN_HEIGHT < ((cs * 3) + 10)
    cs = (($SCREEN_HEIGHT / 2) - 10) / 3
  end
  cs
end

def game_status()
  row_1 = [] << $game[0] << $game[1] << $game[2]
  row_2 = [] << $game[3] << $game[4] << $game[5]
  row_3 = [] << $game[6] << $game[7] << $game[8]

  col_1 = [] << $game[0] << $game[3] << $game[6]
  col_2 = [] << $game[1] << $game[4] << $game[7]
  col_3 = [] << $game[2] << $game[5] << $game[8]

  dia_1 = [] << $game[0] << $game[4] << $game[8]
  dia_2 = [] << $game[2] << $game[4] << $game[6]

  if row_1.all?(1) || row_2.all?(1) || row_3.all?(1) || col_1.all?(1) || col_2.all?(1) || col_3.all?(1) || dia_1.all?(1) || dia_2.all?(1)
    return ['OVER', "Player 1 is the winner (X)"]
  elsif row_1.all?(2) || row_2.all?(2) || row_3.all?(2) || col_1.all?(2) || col_2.all?(2) || col_3.all?(2) || dia_1.all?(2) || dia_2.all?(2)
    return ['OVER', "Player 2 is the winner \u2b24"]
  end
  empty_cells = []
  $game.each_with_index do |item, i| 
    if item == 0
      empty_cells << (i + 1)
    end
  end
  if empty_cells.count == 0
    return ['OVER', "NO WINNER"]
  end
  return ['CONTINUE', ""]
end

def puts_center(str)
  padding = ($SCREEN_WIDTH - str.size) / 2
  puts String.new(" " * padding) + str
end

CELL_SIZE = init_cell_size(10)
CELL_SPACE = String.new(" " * ((CELL_SIZE * 2) + 1))
CHECK_SPACE_X = String.new(" " * CELL_SIZE) + "\u2573" + String.new(" " * CELL_SIZE)
CHECK_SPACE_O = String.new(" " * CELL_SIZE) + "\u2b24" + String.new(" " * CELL_SIZE)
CELL_SEPARATOR = String.new("\u2501" * ((CELL_SIZE * 2) + 1))
VERTICAL = "\u2503"
CROSS = "\u254b"
GRID_ROW = CELL_SPACE + VERTICAL + CELL_SPACE + VERTICAL + CELL_SPACE
GRID_SEPARATOR = CELL_SEPARATOR + CROSS + CELL_SEPARATOR + CROSS + CELL_SEPARATOR
PROMPT = "Enter cell number to check"

player_1_is_playing = true
PLAYER_1_LABEL = "Player for X"
PLAYER_2_LABEL = "Player for \u2b24 "
$game = [0, 0, 0, 0, 0, 0, 0, 0, 0]

game_is_over = false
status = []
loop do
  system("reset")
  puts

  (CELL_SIZE / 2).times do |i| 
    row = String.new(GRID_ROW)
    if i == 0
      if $game[0] == 0
        row[0] = "1"
      end
      if $game[1] == 0
        row[(CELL_SIZE * 2) + 1 + 1] = "2"
      end
      if $game[2] == 0
        row[(CELL_SIZE * 4) + 2 + 2] = "3"
      end
    end
    puts_center row 
  end
  check_space_1 = $game[0] == 0 ? CELL_SPACE : ($game[0] == 1 ? CHECK_SPACE_X : CHECK_SPACE_O)
  check_space_2 = $game[1] == 0 ? CELL_SPACE : ($game[1] == 1 ? CHECK_SPACE_X : CHECK_SPACE_O)
  check_space_3 = $game[2] == 0 ? CELL_SPACE : ($game[2] == 1 ? CHECK_SPACE_X : CHECK_SPACE_O)
  puts_center check_space_1 + VERTICAL + check_space_2 + VERTICAL + check_space_3
  (CELL_SIZE / 2).times { puts_center GRID_ROW }

  puts_center GRID_SEPARATOR
  (CELL_SIZE / 2).times do |i|
    row = String.new(GRID_ROW)
    if i == 0
      if $game[3] == 0
        row[0] = "4"
      end
      if $game[4] == 0
        row[(CELL_SIZE * 2) + 1 + 1] = "5"
      end
      if $game[5] == 0
        row[(CELL_SIZE * 4) + 2 + 2] = "6"
      end
    end
    puts_center row 
  end
  check_space_1 = $game[3] == 0 ? CELL_SPACE : ($game[3] == 1 ? CHECK_SPACE_X : CHECK_SPACE_O)
  check_space_2 = $game[4] == 0 ? CELL_SPACE : ($game[4] == 1 ? CHECK_SPACE_X : CHECK_SPACE_O)
  check_space_3 = $game[5] == 0 ? CELL_SPACE : ($game[5] == 1 ? CHECK_SPACE_X : CHECK_SPACE_O)
  puts_center check_space_1 + VERTICAL + check_space_2 + VERTICAL + check_space_3
  (CELL_SIZE / 2).times { puts_center GRID_ROW }
  puts_center GRID_SEPARATOR

  (CELL_SIZE / 2).times do |i|
    row = String.new(GRID_ROW)
    if i == 0
      if $game[6] == 0
        row[0] = "7"
      end
      if $game[7] == 0
        row[(CELL_SIZE * 2) + 1 + 1] = "8"
      end
      if $game[8] == 0
        row[(CELL_SIZE * 4) + 2 + 2] = "9"
      end
    end
    puts_center row 
  end
  check_space_1 = $game[6] == 0 ? CELL_SPACE : ($game[6] == 1 ? CHECK_SPACE_X : CHECK_SPACE_O)
  check_space_2 = $game[7] == 0 ? CELL_SPACE : ($game[7] == 1 ? CHECK_SPACE_X : CHECK_SPACE_O)
  check_space_3 = $game[8] == 0 ? CELL_SPACE : ($game[8] == 1 ? CHECK_SPACE_X : CHECK_SPACE_O)
  puts_center check_space_1 + VERTICAL + check_space_2 + VERTICAL + check_space_3
  (CELL_SIZE / 2).times { puts_center GRID_ROW }

  unless game_is_over
    player_prompt = (player_1_is_playing ? PLAYER_1_LABEL : PLAYER_2_LABEL) + " is Playing"
    puts
    puts
    puts_center player_prompt 
    puts_center PROMPT
    available_numbers = []
    $game.each_with_index do |item, i| 
      if item == 0
        available_numbers << (i + 1)
      end
    end
    puts_center "Available : " + available_numbers.to_s
    puts
    print " " * (($SCREEN_WIDTH / 2) + 1)
    c = gets.chomp.to_i
    if available_numbers.include?(c)
      $game[c - 1] = player_1_is_playing ? 1 : 2
      status = game_status()
      if status[0] == 'OVER'
        game_is_over = true

      end
      player_1_is_playing = !player_1_is_playing
    end
  else
    puts
    puts
    game_is_over = false
    puts_center 'GAME OVER'
    puts_center status[1]
    puts_center 'Play again ? (Y)'
    print " " * (($SCREEN_WIDTH / 2) + 1)
    c = gets.chomp
    $game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    break unless c.downcase == 'y'
  end
end
