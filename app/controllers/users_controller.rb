class UsersController < ApplicationController

  before_action :authenticate_user, only: [:show]
  before_action :is_logged_user

  def show
    @user = current_user
    @user_events = User.find(params[:id]).event_admin
  end

end

private

def authenticate_user
  unless current_user
    flash[:danger] = "Please log in."
    redirect_to root_path
  end
end

  def is_logged_user
    unless current_user.id == params[:id].to_i
      flash[:danger] = "You can only visit your profile."
      redirect_to root_path
    end
end
