class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Created Event!'
      redirect_to "/users/#{current_user.id}"
    else
      flash[:error] = 'Something Went Wrong!'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    @upcoming_events = Event.upcoming
    @previous_events = Event.previous
  end

  private

  def event_params
    params.require(:event).permit(:title, :when, :where, :description)
  end
end
