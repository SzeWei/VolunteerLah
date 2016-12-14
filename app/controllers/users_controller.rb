class UsersController < ApplicationController
  before_action :set_user

  def show
    @user = User.find(params[:id])
    @events = @user.events.order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def destroy
    if current_user.admin?
      @user.destroy
      redirect_to root_path, notice: 'user deleted'
    end
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end