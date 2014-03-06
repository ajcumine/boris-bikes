require "./lib/bike_container"
require "./lib/van"
require "./lib/docking_station"
require "./lib/bike"

describe Van do
  
  it "should collect available bikes fromt the station" do
    station = DockingStation.new
    van = Van.new
    available_bike = Bike.new
    station.dock(available_bike)
    van.collect_available_bikes_from(station)
    expect(van.bikes).to include(available_bike)
    expect(station).to be_empty
  end


end