class SearchesController < ApplicationController


  def show
    start_point_coords = find_coords(params[:s])
    destination_coords = find_coords(params[:d])
    start_point_station = find_closest(start_point: params[:s], looking_for: "availableBikes")
    destination_station = find_closest(start_point: params[:d], looking_for: "availableDocks")
    @final_points = [start_point_coords, [start_point_station["latitude"], start_point_station["longitude"]], [destination_station["latitude"], destination_station["longitude"]], destination_coords, params[:s], params[:d]]
  end

  def login
    render :partial => 'login'
  end

  def signup
    render :partial => 'signup'
  end

end
