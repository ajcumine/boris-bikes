class DockingStation

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def release_to_van(van)
    @bikes.reject {|bike| !bike.broken?}.each do |bike|
      release(bike)
      van.dock(bike)
    end
  end

  def accept_from_van(van)
    van.bikes.each {|bike| self.dock(bike)}
  end

end