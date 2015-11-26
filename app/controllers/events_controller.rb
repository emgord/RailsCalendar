class EventsController < ApplicationController
  def index
    @events = Event.where(:user_id => params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    id = params[:id]
    @event = Event.find(id)
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params[:event])
    redirect_to user_events_path(:user_id => params[:user_id])
  end

  def destroy
    id = params[:id]
    Event.delete(id)
    redirect_to "/"
  end

  def edit
    id = params[:id]
    @event = Event.find(id)
  end

  def update
    id = params[:id]
    event = Event.find(id)
    event.update(
    name: event_params[:event][:name],
    description: event_params[:event][:description],
    event_date: event_params[:event][:event_date],
    user_id: event_params[:event][:user_id]
    )
    redirect_to "/"
  end


  private

  def event_params
    params.permit(event:[:name, :description, :event_date, :user_id])
  end
end
