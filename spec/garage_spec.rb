require "./lib/van"
require "./lib/garage"
require "./lib/bike_container"

describe Garage do
  
  let(:garage) { Garage.new(:capacity => 123)}

  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(123)
  end

  it "should release all the working bikes to the van" do
    working_bike, broken_bike, van = Bike.new, Bike.new, Van.new
    broken_bike.break
    garage.dock(working_bike)
    garage.dock(broken_bike)
    expect(garage.release_to_van(van)).to eq([working_bike])
  end

  it "should accept and fix all the bikes from the van" do
    fixed_bike, van = Bike.new, Van.new
    fixed_bike.break
    3.times {van.dock(fixed_bike)}
    expect(garage.accept_from_van(van)).to eq([fixed_bike, fixed_bike, fixed_bike])
  end

end