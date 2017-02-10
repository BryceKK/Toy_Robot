require './table'

class Robot
  attr_reader :location, :direction
  NORTH = [0,-1]
  SOUTH = [0,1]
  EAST = [1,0]
  WEST = [-1,0]
  DIRECTIONS = [:north, :east, :south, :west]
  OFFSETS = [NORTH, EAST, SOUTH, WEST]

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
    @location = @table.check_movement(@location, OFFSETS[DIRECTIONS.index(@direction)])
  end
end

#throw exceptions, be more guarded
#allow for more robots
#allow for multiple moving at once
#table can not be uniform side length

#I can move the move function to table. But then command to report
#locations or turn is weird. But also I can't put it all in table
#surely. Idk man. Shit's weird
