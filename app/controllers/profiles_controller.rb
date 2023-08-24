class ProfilesController < ApplicationController

  def index
   
  end

  def show
    @profile = User.find(params[:id])
    @profiles = User.all.where(email:current_user.email)
  end

end
