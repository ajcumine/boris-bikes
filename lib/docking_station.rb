require_relative 'bike_container'

class DockingStation

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def release_to_van
    @bikes = bikes.reject {|bike| bike.broken?}
  end

  def accept_from_van(van_accept)
    @bikes = bikes.concat(van_accept)
  end

end