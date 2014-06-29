module ApplicationHelper

  def google_walking_directions(args)
    options = {
      languange: :en,
      alternative: :true,
      sensor: :false,
      mode: :walking
    }
    GoogleDirections.new(args[:start],args[:destination],options)
  end

  def google_biking_directions(args)
    options = {
      languange: :en,
      alternative: :true,
      sensor: :false,
      mode: :biking
    }
    GoogleDirections.new(args[:start],args[:destination],options)
  end

  def find_closest_bike(start_point)
    p station_list = get_station_list
  end

  # def find_closest_bike(args)
  #   station_list = get_station_list
  #   closest = station_list.first
  #   station_list.each do |station|
  #     if google_walking_directions(start: args[:start], destination: "#{station['latitude']},#{station['longitude']}").distance < google_walking_directions(start: args[:start], destination: "#{closest['latitude']},#{closest['longitude']}").distance && station.availableBikes > 1
  #       closest = station
  #     end
  #   end
  #   closest
  # end

  # def find_closest_dock(args)
  #   station_list = get_station_list
  #   closest = station_list.first
  #   station_list.each do |station|
  #     if google_walking_directions(destination: args[:destination], start: "#{station.latitude},#{station.longitude}").distance < google_walking_directions(start: args[:destination], destination: "#{closest.latitude},#{closest.longitude}").distance && station.availableDocks > 1
  #       closest = station
  #     end
  #   end
  #   closest
  # end

  def get_station_list
    uri = URI.parse("http://www.citibikenyc.com/stations/json")
    res = Net::HTTP.get_response(uri)
    json_response = JSON.parse(res.body)
    json_response["stationBeanList"]
  end

end
