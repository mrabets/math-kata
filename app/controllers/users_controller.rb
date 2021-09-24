class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    
    if @user.image.nil?
      @user.image = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" 
    end

    if @user.name.nil?
      @user.name = "User-#{@user.id}"
    end
  end
end
