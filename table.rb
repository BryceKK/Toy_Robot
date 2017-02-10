require './robot'

class Table
  attr_reader :robots
  def initialize(width, height)
    @WIDTH = width
    @HEIGHT = height
    @robots = []
    @names = []
  end

  def check_movement(location,direction)
    if is_valid([location[0]+direction[0], location[1]+direction[1]])
      return [location[0]+direction[0], location[1]+direction[1]]
    end
    return location
  end

  def is_valid(location)
    return false unless (location[0] > 0) && (location[0] <= @WIDTH)
    return false unless (location[1] > 0) && (location[1] <= @HEIGHT)
    return true
  end

  def add_robot(x,y,direction,name)
    @robots.push(Robot.new(x,y,direction,self))
    @names.push(name)
  end

  def command(name)
    puts name
    puts @robots[@names.index(name)]
    return @robots[@names.index(name)]
  end
end

#list of robot objects
