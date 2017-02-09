require './table'

class Robot
  attr_reader :location, :direction
  NORTH = [0,-1]
  SOUTH = [0,1]
  EAST = [1,0]
  WEST = [-1,0]
  DIRECTIONS = [:north, :east, :south, :west]

  def initialize(x,y,direction,table)
    @location = [x,y]
    @direction = direction
    @table = table
  end

  def turn_right
    @direction == :west ? @direction = :north : @direction = DIRECTIONS[DIRECTIONS.index(@direction)+1]
  end

  def turn_left
    @direction == :north ? @direction = :west : @direction = DIRECTIONS[DIRECTIONS.index(@direction)-1]
  end

  def move()
    #move forward, passing direction.
    @location = @table.check_movement(@location, @direction)
  end
end
