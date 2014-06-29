class RidesController < ApplicationController

  def save
    @user = User.find(params[:user_id])
    render :partial => 'users/home'
  end

end
