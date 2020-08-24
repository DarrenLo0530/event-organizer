class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = current_user.created_events.build
  end
  
  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      current_user.attended_events << @event
      redirect_to events_path
    else
      flash.now[:danger] = @event.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if event.update(event_params)
      redirect_to event_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :time)
  end
end
