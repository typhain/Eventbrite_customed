class EventsController < ApplicationController

  before_action :authenticate_user, only: [:new]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @event_end = @event.start_date + (@event.duration * 60)

    @admin = is_admin?
    @attendee = is_attendee?

  end

  def create

    @user = current_user

    @event = Event.new(:administrator => @user, :start_date => params[:start_date], :duration => params[:duration], :title => params[:title], :description => params[:description], :price => params[:price], :location => params[:location])
      if @event.save
        redirect_to root_path
      else
        render events_path
      end
  end


  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end

  def is_admin?
    if current_user == @event.administrator
      true
    end
  end

  def is_attendee?
    if @event.users.include?(current_user)
      true
    end
  end

end
