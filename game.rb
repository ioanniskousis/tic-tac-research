class Game
  WINNER_1 = ['OVER', "Player with \u2573 is the winner"]
  WINNER_2 = ['OVER', "Player with \u2b24 is the winner"]
  NO_WINNER = ['OVER', "NO WINNER"]
  CONTINUE = ['CONTINUE', ""]

  checks = [0, 0, 0, 0, 0, 0, 0, 0, 0]

  # attr_reader :current_user

  # self.current_user = 1

  public
  def current_player
    current_user
  end

  def self.user_moves
    checks
  end

  def check(cell, user)
    checks[cell - 1] = user
    current_user = user == 2 ? 1 : 2
  end

  def available_cells
    numbers = []
    checks.each_with_index do |item, i| 
      if item == 0
        numbers << (i + 1)
      end
    end
    numbers
  end

  def status
    grid_sets = all_sets
    return WINNER_1 if grid_sets.any? { |set| set.all?{ |check| check == 1 } }
    return WINNER_2 if grid_sets.any? { |set| set.all?{ |check| check == 2 } }
    return NO_WINNER if checks.none?(0)
    return CONTINUE
  end

  private 
  def all_sets
    row_1 = [] << checks[0] << checks[1] << checks[2]
    row_2 = [] << checks[3] << checks[4] << checks[5]
    row_3 = [] << checks[6] << checks[7] << checks[8]
  
    col_1 = [] << checks[0] << checks[3] << checks[6]
    col_2 = [] << checks[1] << checks[4] << checks[7]
    col_3 = [] << checks[2] << checks[5] << checks[8]
  
    dia_1 = [] << checks[0] << checks[4] << checks[8]
    dia_2 = [] << checks[2] << checks[4] << checks[6]

    sets =[]

    sets << row_1 << row_2 << row_3 << col_1 << col_2 << col_3 << dia_1 << dia_2
    sets
  end
end