class Table
  SIDE_LENGTH = 5
  def is_valid(location)
    return false unless (location[0] > 0) && (location[0] <= SIDE_LENGTH)
    return false unless (location[1] > 0) && (location[1] <= SIDE_LENGTH)
    return true
  end
  
  def north(location)
    if is_valid([location[0], (location[1]-1)])
      return [location[0], (location[1]-1)]
    end
    return false
  end
  def south(location)
    if is_valid([location[0], (location[1]+1)])
      return [location[0], (location[1]+1)]
    end
    return false
  end
  def east(location)
    if is_valid([(location[0]+1), location[1]])
      return [(location[0]+1), location[1]]
    end
    return false
  end
  def west(location)
    if is_valid([(location[0]-1), location[1]])
      return [(location[0]-1), location[1]]
    end
    return false
  end
end
