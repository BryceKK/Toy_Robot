require 'rspec'
require './table'
require './robot'

describe "Table" do
  before(:all) do
    @NORTH = [0,-1]
    @SOUTH = [0,1]
    @EAST = [1,0]
    @WEST = [-1,0]

    @table = Table.new(5,5)

    @robot = Robot.new(2,2,:north,@table)

    @northbot = Robot.new(2,2,:north,@table)
    @southbot = Robot.new(2,2,:south,@table)
    @eastbot = Robot.new(2,2,:east,@table)
    @westbot = Robot.new(2,2,:west,@table)
  end
  # Checking valid locations
  it "Should understand valid table locations" do
    expect(@table.is_valid([1,3])).to eq(true)
  end
  it "Should understand the max range of y" do
    expect(@table.is_valid([1,6])).to eq(false)
  end
  it "Should understand the max range of x" do
    expect(@table.is_valid([6,3])).to eq(false)
  end
  it "Should understand the min range of x" do
    expect(@table.is_valid([-1,3])).to eq(false)
  end
  it "Should understand the min range of y" do
    expect(@table.is_valid([1,-3])).to eq(false)
  end

  # Checking directions
  it "Should know the north square" do
    expect(@table.check_movement(@robot.location,@NORTH)).to eq([2,1])
  end
  it "Should know the south square" do
    expect(@table.check_movement(@robot.location,@SOUTH)).to eq([2,3])
  end
  it "Should know the east square" do
    expect(@table.check_movement(@robot.location,@EAST)).to eq([3,2])
  end
  it "Should know the west square" do
    expect(@table.check_movement(@robot.location,@WEST)).to eq([1,2])
  end

  # Checking robot placement
  it "Should return a side placement" do
    expect(Robot.new(1,2,:north,@table).location).to eq([1,2])
  end
  it "Should return a middle placement" do
    expect(Robot.new(3,3,:north,@table).location).to eq([3,3])
  end
  # it "Should fail an invalid placement" do
  #   expect(Robot.new(6,2,:north,@table).location).to eq(false)
  # end

  # Checking robot turning
  it "Should turn left north to west" do
    @northbot.turn_left
    expect(@northbot.direction).to eq(:west)
    @northbot.turn_right
  end
  it "Should turn left west to south" do
    @westbot.turn_left
    expect(@westbot.direction).to eq(:south)
    @westbot.turn_right
  end
  it "Should turn left south to east" do
    @southbot.turn_left
    expect(@southbot.direction).to eq(:east)
    @southbot.turn_right
  end
  it "Should turn left east to north" do
    @eastbot.turn_left
    expect(@eastbot.direction).to eq(:north)
    @eastbot.turn_right
  end
  it "Should turn right north to east" do
    @northbot.turn_right
    expect(@northbot.direction).to eq(:east)
    @northbot.turn_left
  end
  it "Should turn right east to south" do
    @eastbot.turn_right
    expect(@eastbot.direction).to eq(:south)
    @eastbot.turn_left
  end
  it "Should turn right south to west" do
    @southbot.turn_right
    expect(@southbot.direction).to eq(:west)
    @southbot.turn_left
  end
  it "Should turn right west to north" do
    @westbot.turn_right
    expect(@westbot.direction).to eq(:north)
    @westbot.turn_left
  end

  it "Should move in a valid direction" do
    @westbot.move
    expect(@westbot.location).to eq([1,2])
  end
  it "Should not move in an invalid direction" do
    @westbot.move
    expect(@westbot.location).to eq([1,2])
  end

  it "Should create a robot with table" do
    r_table = Table.new(5,5)
    r_table.add_robot(2,2,:north,:R1)
    #r_table.command(:R1).move
    expect(r_table.command(:R1).location).to eq([2,2])
  end
end
