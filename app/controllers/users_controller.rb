class UsersController < ApplicationController
  before_action :find_user

  def show
    if current_user == @user
      @q = Task.where(user_id: current_user.id).ransack(params[:q])
      @tasks = @q.result(distinct: true)
    end
  end

  def search
    show
    render :show
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
    
    if @user.image.nil?
      @user.image = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" 
    end

    if @user.name.nil?
      @user.name = "User-#{@user.id}"
    end
  end

  # def find_tasks
  #   Task.where(user_id: current_user.id) 
  # end
end
