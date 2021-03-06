require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  
  let(:bike) {Bike.new}
  let(:holder) {ContainerHolder.new}


  it "should accept a bike" do        
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)    
    expect(holder.bike_count).to eq(1)
  end

  it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it "should know when it's full" do
    expect(holder).not_to be_full
    fill_holder holder
    expect(holder).to be_full
  end

  it "should not accept a bike if it's full" do
    fill_holder holder
    expect{ holder.dock(bike) }.to raise_error(RuntimeError)
  end

  it "should provide the list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new    
    broken_bike.break
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

  it "should know when it's empty" do
    expect(holder).to be_empty
  end

  it "should not release a bike if it's empty" do
    expect{holder.release(bike)}.to raise_error(RuntimeError)
  end

  it "should know if something is not a bike" do
    expect{holder.dock("notabike")}.to raise_error(RuntimeError)
    holder.dock(bike)
    expect{holder.release("notabike")}.to raise_error(RuntimeError)
  end

  it "should provide a list of broken bikes" do
    broken_bike = Bike.new
    broken_bike.break
    holder.dock(broken_bike)
    expect(holder.broken_bikes_docked).to eq([broken_bike])
  end

  def fill_holder(holder)
    holder.capacity.times { holder.dock(Bike.new) }
  end

end