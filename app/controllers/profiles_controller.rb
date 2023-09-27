class ProfilesController < ApplicationController

  def index
   
  end

  def show
    
    @profile = Profile.new
    @profile1 = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end


  
  def new
    @profile = Profile.new
  end

  def create 
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path
    end
  
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @profile = current_user.profile
    @profile.destroy

    redirect_to root_path
  end




 
  private

  def profile_params
    params.require(:profile).permit(:mobilenumber, :address, :profile_image, :remove_profile_image).merge(user_id: current_user.id)
  end

end
