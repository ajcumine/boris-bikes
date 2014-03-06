require "./lib/docking_station"
require "./lib/van"
require "./lib/bike_container"

describe DockingStation do

  let(:station) { DockingStation.new(:capacity => 123) }
  
  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should release all the broken bikes to the van" do
    working_bike, broken_bike, van = Bike.new, Bike.new, Van.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.release_to_van(van)).to eq([broken_bike])
  end

  it "should accept all the bikes from the van" do
    working_bike, van = Bike.new, Van.new
    3.times {van.dock(working_bike)}
    expect(station.accept_from_van(van)).to eq([working_bike, working_bike, working_bike])
  end


end