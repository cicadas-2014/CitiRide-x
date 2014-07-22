module ApplicationHelper

  # def google_walking_directions(args)
  #   options = {
  #     languange: :en,
  #     alternative: :true,
  #     sensor: :false,
  #     mode: :walking
  #   }
  #   GoogleDirections.new(args[:start],args[:destination],options)
  # end

  # def google_biking_directions(args)
  #   options = {
  #     languange: :en,
  #     alternative: :true,
  #     sensor: :false,
  #     mode: :biking
  #   }
  #   GoogleDirections.new(args[:start],args[:destination],options)
  # end

  # args = {start_point: "7 carmine street, New York, NY", looking_for: "availableBikes" or "availableDocks"}

  def find_coords(address)
    location = Geocoder.search(address)
    [location[0].latitude, location[0].longitude]
  end

  def find_closest(args)
    station_list = get_station_list
    location = Geocoder.search(args[:start_point]) #can maybe also use the GoogleDirections gem here? All we're doing here is getting the latitude and longitude
    stations_array = []
    station_list.each do |station|
      distance = GeoDistance.distance(location[0].latitude, location[0].longitude, station["latitude"], station["longitude"]).miles.number
      stations_array << [station, distance]
    end
    get_closest_station(stations_array: stations_array, looking_for: args[:looking_for])
  end

  # args = {stations_array: stations_array, looking_for: looking_for}
  def get_closest_station(args)
    stations_array = args[:stations_array]
    stations_array.sort!{|a,b| a[1] <=> b[1]}
    stations_array.each do |station|
      return station[0] if (station[0][args[:looking_for]])>2
    end
  end

  def get_station_list
    uri = URI.parse("http://www.citibikenyc.com/stations/json")
    res = Net::HTTP.get_response(uri)
    json_response = JSON.parse(res.body)
    json_response["stationBeanList"]
  end

end
