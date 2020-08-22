class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(event_params)
    if @post.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if post.update(event_params)
      redirect_to event_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
  end


  private
  def set_event
    @event = event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :time)
  end
end
