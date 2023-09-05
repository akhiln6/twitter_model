class ProfilesController < ApplicationController

  def index
   
  end

  def show
    
    @profile = Profile.new
    @profile1 = current_user.profile
  end
  
  def new
    @profile = Profile.new
  end

  def create 
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path
    end
  
  end




 
  private

  def profile_params
    params.require(:profile).permit(:mobilenumber, :address).merge(user_id: current_user.id)
  end

end
