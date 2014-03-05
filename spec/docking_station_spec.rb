require "./lib/docking_station"

describe DockingStation do

  let(:station) { DockingStation.new(:capacity => 123) }
  
  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should release all the broken bikes to the van" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.release_to_van).to eq([working_bike])
  end

  it "should accept all the bikes from the van" do
    working_bike = Bike.new
    van_accept = [working_bike, working_bike, working_bike]
    station.accept_from_van(van_accept)
    expect(station.available_bikes).to eq([working_bike, working_bike, working_bike])
  end


end