class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def release_to_van(van)
    # each will return the array it's iterating on, in this case it will be
    # the return value of reject(), which will then be returned by the method
    @bikes.reject {|bike| bike.broken? }.each do |bike|
      release(bike)
      van.dock(bike)
    end
  end

  def accept_from_van(van)
    van.bikes.each {|bike| bike.fix; self.dock(bike)}
  end

end
