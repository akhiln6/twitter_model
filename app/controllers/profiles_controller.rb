class ProfilesController < ApplicationController

  def index
   
  end

  def show
    
    @profile = Profile.new
    @profiles = Profile.all
  end
  
  def new
    @profile = Profile.new
  end

  def create 
    @profile = current_user.profile.create(profile_params)
    redirect_to root_path
  end




 
  private

  def profile_params
    params.require(:profile).permit(:mobilenumber, :address)
  end

end
