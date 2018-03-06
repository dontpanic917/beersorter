require 'json'
require 'pry'
require 'rest-client'
class Beers
  @@all=[]
  def initialize(name,abv,ibu,srm)
    @name=name
    @abv=abv
    @ibu=ibu
    @srm=srm
  end
  def self.query
    url="https://api.punkapi.com/v2/beers?"
    beerlist = RestClient.get(url,{params: {hops: 'cascade'}})
    # size=beerlist.size
    # beerlist.map {|beer| @@all << objectizer(beer)}
    beerarray = JSON(beerlist)
    beerarraysize = beerarray.size
    beerarray.map {|beer| @@all << (Beers.new(beer["name"],beer["abv"],beer["ibu"], beer["srm"]))}
    binding.pry
  end
  # def objectizer(beer_hash)
  #   #imports attributes and instantiates and maps to a beer object using JSON parsing
  #   @name=  JSON(beerhash)[:name]
  # end
end
Beers.query
