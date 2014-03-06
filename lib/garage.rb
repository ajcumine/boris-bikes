class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def release_to_van(van)
    # van_bikes = []
    # @bikes.each do |bike|
    #   if bike.broken? == false
    #     van_bikes << bike
    #     release(bike)
    #   else
    #     @bikes.flatten
    #   end
    # end
    # van_bikes

    # each will return the array it's iterating on, in this case it will be
    # the return value of reject(), which will then be returned by the method
    @bikes.reject {|bike| bike.broken? }.each do |bike|
      release(bike)
      van.dock(bike)
    end
  end

  def accept_from_van(van)
    van.bikes.each {|bike| self.dock(bike)}
  end

  def fix_bikes
    self.bikes.each {|bike| bike.fix}
  end

end
