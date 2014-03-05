module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||=[]
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    only_bikes(bike)
    raise "Station is full" if full?
    bikes << bike
  end

  def release(bike)
    only_bikes(bike)
    raise "Station is empty" if empty?
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject {|bike| bike.broken?}
  end

  def empty?
    bike_count == 0
  end

  def broken_bikes_docked
    bikes.reject {|bike| !bike.broken?}
  end

  def only_bikes(bike)
    raise "This station is only for bikes" if !(bike.is_a?(Bike))
  end

end