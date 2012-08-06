require_dependency "timeline_keeper/application_controller"

module TimelineKeeper
  class TimelinesController < ApplicationController
    def index
      @timelines = Timeline.all
    end
  
    def show
      @timeline = Timeline.find(params[:id])
      @events   = @timeline.events.where('media IS NOT NULL OR text IS NOT NULL')
      @events_all = @timeline.events.order(:startDate)
      respond_to do |format|
        format.html
        format.json do
          # FIXME: this is terribly ugly but work so far
          dates = @events.map do |event| 
            return_event = event.attributes
            return_event[:asset] = {:media => event.media, :credit => event.credit, :caption => event.caption}
            return_event['startDate'] = return_event['startDate'].to_s.gsub('-',',')
            return_event['endDate'] = return_event['endDate'].to_s.gsub('-',',')
            return_event
          end
          timeline = @timeline.attributes
          # timeline[:asset] ={:media => @timeline.media, :credit => @timeline.credit, :caption => @timeline.caption}
          timeline[:type] = 'default'
          timeline[:date] = dates
          hash = {:timeline => timeline}
          render :json => hash.to_json
        end
      end
    end
  end
end
