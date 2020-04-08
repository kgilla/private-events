class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash[:success] = 'Created Event!'
      redirect_to root_url
    else
      flash[:error] = 'Something Went Wrong!'
      render 'new'
    end
  end

  def show
    @event_detail = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :when, :where, :description)
  end
end
