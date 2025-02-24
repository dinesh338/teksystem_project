class WeatherReport
  # Hardcoded Whether data, it could be done effectively by MySQL, but went with Service Object for simplicity. 
  CITY_DATA = [
    { city: "manali", state: "Himachal Pradesh", zip_code: "233454", currrent_temperature: 15, min_temperature: 10, max_temperature: 20, condition: "Sunny"  },
    { city: "goa", state: "Goa", zip_code: "875904", currrent_temperature: 13, min_temperature: 8, max_temperature: 17, condition: "Cloudy" },
    { city: "mumbai", state: "Maharastra", zip_code: "564782", currrent_temperature: 18, min_temperature: 12, max_temperature: 24, condition: "Rainy" }
  ]


  # Simulates searching for an address by Zip code
  def self.find_by_zipcode(zip_code)
    CITY_DATA.find { |address| address[:zip_code].eql?(zip_code) }
  end

  # Simulates searching for an address by city name
  def self.find_by_city(city)
    CITY_DATA.find { |address| address[:city].eql?(city) }
  end
end