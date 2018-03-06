class GetBeers
  def query(query)
    url="https://api.punkapi.com/v2/beers?hops=cascade"
    beerlist = RestClient.get(url)
  end
end
