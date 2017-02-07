require 'rspec'
require './table'

describe "Table" do
  # Checking valid locations
  it "Should understand valid table locations" do
    expect(Table.new().is_valid([1,3])).to eq(true)
  end
  it "Should understand the max range of y" do
    expect(Table.new().is_valid([1,6])).to eq(false)
  end
  it "Should understand the max range of x" do
    expect(Table.new().is_valid([6,3])).to eq(false)
  end
  it "Should understand the min range of x" do
    expect(Table.new().is_valid([-1,3])).to eq(false)
  end
  it "Should understand the min range of y" do
    expect(Table.new().is_valid([1,-3])).to eq(false)
  end

  # Checking directions
  it "Should know the north square" do
    expect(Table.new().north([2,2])).to eq([2,1])
  end
  it "Should know the south square" do
    expect(Table.new().south([2,2])).to eq([2,3])
  end
  it "Should know the east square" do
    expect(Table.new().east([2,2])).to eq([3,2])
  end
  it "Should know the west square" do
    expect(Table.new().west([2,2])).to eq([1,2])
  end
end
