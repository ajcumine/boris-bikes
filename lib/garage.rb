require_relative 'bike_container'

class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def release_to_van
    van_bikes = []
    @bikes.each do |bike|
      if bike.broken? == false
        van_bikes << bike
        release(bike)
      else
        @bikes.flatten
      end
      van_bikes
    end
  end

  def accept_from_van(van_bikes)
    van_bikes.each do |bike|
      dock(bike)
    end
    @bikes
  end

  def fix_bikes
    @bikes.each do |bike|
      bike.fix
    end
    @bikes
  end

end
