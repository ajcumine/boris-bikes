require "./lib/garage"

describe Garage do
  
  let(:garage) { Garage.new(:capacity => 123)}

  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(123)
  end

  it "should release all the working bikes to the van" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    garage.dock(working_bike)
    garage.dock(broken_bike)
    expect(garage.release_to_van).to eq([working_bike])
  end

  it "should accept all the bikes from the van" do
    working_bike = Bike.new
    van_bikes = [working_bike, working_bike, working_bike]
    expect(garage.accept_from_van(van_bikes)).to eq([working_bike, working_bike, working_bike])
  end

  it "should fix bikes" do
    broken_bike = Bike.new
    broken_bike.break
    van_accept = [broken_bike, broken_bike]
    garage.accept_from_van(van_accept)
    expect(garage.fix_bikes).to eq([broken_bike, broken_bike])
  end

end