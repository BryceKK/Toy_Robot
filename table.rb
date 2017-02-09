require './robot'

class Table
  def initialize(side)
    @SIDE_LENGTH = side
  end

  def check_movement(location,direction)
    if is_valid([location[0]+direction[0], location[1]+direction[1]])
      return [location[0]+direction[0], location[1]+direction[1]]
    end
    return location
  end

  def is_valid(location)
    return false unless (location[0] > 0) && (location[0] <= @SIDE_LENGTH)
    return false unless (location[1] > 0) && (location[1] <= @SIDE_LENGTH)
    return true
  end
end
