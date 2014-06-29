class SearchesController < ApplicationController


  def show
    p find_closest(start_point: "7 carmine street, New York, NY", looking_for: "availableBikes")
    p find_closest(start_point: "48 Wall Street, New York, NY", looking_for: "availableDocks")
  end

  def login
    render :partial => 'login'
  end

  def signup
    render :partial => 'signup'
  end

end
