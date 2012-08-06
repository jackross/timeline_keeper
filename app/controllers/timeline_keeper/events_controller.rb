require_dependency "timeline_keeper/application_controller"

module TimelineKeeper
  class EventsController < ApplicationController
    def index
      if params[:query].present?
        @events = Event.search(params[:query])
      else
        @events = Event.limit(5).all
      end
    end
  
    def show
      @event = Event.find(params[:id])
    end
  end
end
