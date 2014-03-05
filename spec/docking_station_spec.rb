require "./lib/docking_station"

describe DockingStation do

  let(:station) { DockingStation.new(:capacity => 123) }

  def fill_station(station)
    20.times {station.dock(Bike.new)}
  end
  
  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should release all the broken bikes to the van" do
    broken_bike = Bike.new
    broken_bike.break
    station.dock(broken_bike)
    expect(station.broken_bikes_docked).to eq([broken_bike])
    # expect(station.release_to_van)
  end

end