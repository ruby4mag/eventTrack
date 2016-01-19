class EventsController < ApplicationController

def create
    @user = Event.new(event_params)
    # ...
  end

  private

  def event_params
    params.require(:event).permit(:hostname, :servicename, :severity, :message, :ticket_status, :ticket_number, :event_source, first_time, :last_occurance, :count, :commit)
  end


end
