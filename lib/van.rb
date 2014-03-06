class Van

  include BikeContainer

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

end