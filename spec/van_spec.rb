require "./lib/bike_container"
require "./lib/van"
require "./lib/docking_station"
require "./lib/bike"
require "./lib/garage"

describe Van do

  let(:van) { Van.new(:capacity => 123)}

  it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(123)
  end
  
  it "should collect broken bikes from the station" do
    station, van, broken_bike = DockingStation.new, Van.new, Bike.new
    broken_bike.break
    station.dock(broken_bike)
    van.collect_broken_bikes_from_station(station)
    expect(van.bikes).to include(broken_bike)
    expect(station).to be_empty
  end

  it "should collect working bikes from the garage" do
    garage, van, working_bike = Garage.new, Van.new, Bike.new
    garage.dock(working_bike)
    van.collect_working_bikes_from_garage(garage)
    expect(van.bikes).to include(working_bike)
    expect(garage).to be_empty
  end

  it "should release broken bikes to the garage" do
    garage, van, broken_bike = Garage.new, Van.new, Bike.new
    broken_bike.break
    van.dock(broken_bike)
    van.release_broken_bikes_to_garage(garage)
    expect(van).to be_empty
    expect(garage.bikes).to include(broken_bike)
  end

  it "should release working bikes to the station" do
    station, van, working_bike = DockingStation.new, Van.new, Bike.new
    van.dock(working_bike)
    van.release_working_bikes_to_station(station)
    expect(van).to be_empty
    expect(station.bikes).to include(working_bike)
  end


end