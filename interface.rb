class UserInterface
  
  def self.setup(ckecks, player)
    system("reset") || system("cls")

    interface = []
    interface << "Game State      " + ckecks.to_s + "  Shows which player checked each cell. 0 means the cell is empty"
    interface << "Available cells " + self.available_cells(ckecks).to_s.gsub("0,", "  ").gsub("0", " ") + "  Shows which cells are unchecked"
    interface << ""
    interface << "Player " + player.to_s + " : Enter cell number to check OR Z to end the program"
    interface << ""
  end

  private

  def self.available_cells(checks)
    numbers = []
    checks.each_with_index do |item, i| 
      if item == 0
        numbers << (i + 1)
      else
        numbers << 0
      end
    end
    numbers
  end

end