class Users
  @@all
  def initialize(name)
    @name=name
    @@all << self
  end
  def query(query)
    beers = get_beers(query)
    
  end
end
