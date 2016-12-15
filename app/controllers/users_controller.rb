class UsersController < ApplicationController
  before_action :set_user

  def show
    @user = User.find(params[:id])
    @events_open = @user.events.where(status: :open).order("created_at DESC")

    @events_expired = @user.events.where(status: :expired).order("created_at DESC")

    @volunteered_events_open = @user.volunteered_events.where(status: :open).order(:desc)
    @volunteered_events_expired = @user.volunteered_events.where(status: :expired).order(:desc)
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