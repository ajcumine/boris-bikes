class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def collect_broken_bikes_from_station(station)
    station.bikes.reject {|bike| !bike.broken?}.each do |bike|
      station.release(bike)
      self.dock(bike)
    end
  end

  def collect_working_bikes_from_garage(garage)
    garage.bikes.reject {|bike| bike.broken?}.each do |bike|
      garage.release(bike)
      self.dock(bike)
    end
  end

  def release_broken_bikes_to_garage(garage)
    self.bikes.reject {|bike| !bike.broken?}.each do |bike|
      self.release(bike)
      garage.dock(bike)
    end
  end

  def release_working_bikes_to_station(station)
    self.bikes.reject {|bike| bike.broken?}.each do |bike|
      self.release(bike)
      station.dock(bike)
    end
  end

end