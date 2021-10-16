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
  end
end
