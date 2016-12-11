class UsersController < ApplicationController
  before_action :set_user

  def show
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