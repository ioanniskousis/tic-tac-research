class Game
  WINNER_1 = ['OVER', "Player with \u2573 is the winner"]
  WINNER_2 = ['OVER', "Player with \u2b24 is the winner"]
  NO_WINNER = ['OVER', "NO WINNER"]
  CONTINUE = ['CONTINUE', ""]

  @@checks = [0, 0, 0, 0, 0, 0, 0, 0, 0]
  @@player = 1

  def self.current_player
    @@player
  end

  def self.user_moves
    @@checks
  end

  def self.check(cell)
    cell = cell.to_i
    return false unless cell.positive?
    return false if @@checks[cell - 1] != 0
    @@checks[cell - 1] = @@player
    @@player = @@player == 1 ? 2 : 1
    true
  end

  # def self.available_cells
  #   numbers = []
  #   @@checks.each_with_index do |item, i| 
  #     if item == 0
  #       numbers << (i + 1)
  #     end
  #   end
  #   numbers
  # end

  def self.status
    grid_sets = self.all_sets
    # if grid_sets.any? { |set| set.all?{ |check| check == 1 } } 
    #   puts grid_sets
    #   c = gets

    # end
    # if grid_sets.any? { |set| set.all?{ |check| check == 2 } } 
    #   puts grid_sets
    #   c = gets

    # end
    # if @@checks.none?(0) 
    #   puts @@checks
    #   c= gets
    # end
    return WINNER_1 if grid_sets.any? { |set| set.all?{ |check| check == 1 } }
    return WINNER_2 if grid_sets.any? { |set| set.all?{ |check| check == 2 } }
    return NO_WINNER if @@checks.none?(0)
    return CONTINUE
  end

  private 
  def self.all_sets
    row_1 = [] << @@checks[0] << @@checks[1] << @@checks[2]
    row_2 = [] << @@checks[3] << @@checks[4] << @@checks[5]
    row_3 = [] << @@checks[6] << @@checks[7] << @@checks[8]
  
    col_1 = [] << @@checks[0] << @@checks[3] << @@checks[6]
    col_2 = [] << @@checks[1] << @@checks[4] << @@checks[7]
    col_3 = [] << @@checks[2] << @@checks[5] << @@checks[8]
  
    dia_1 = [] << @@checks[0] << @@checks[4] << @@checks[8]
    dia_2 = [] << @@checks[2] << @@checks[4] << @@checks[6]

    sets =[]

    sets << row_1 << row_2 << row_3 << col_1 << col_2 << col_3 << dia_1 << dia_2
    sets
  end
end