module TimelineKeeper
  class Event < ActiveRecord::Base
    attr_accessible :caption, :credit, :endDate, :headline, :media, :media_filename, :startDate, :text, :thumbnail

    has_many :timeline_events
    has_many :timelines, :through => :timeline_events

    # ElasticSearch setup
    include Tire::Model::Search
    include Tire::Model::Callbacks
    mapping do
      indexes :id,           :index    => :not_analyzed    
      indexes :media_filename,     :index => :not_analyzed
      indexes :headline,        :analyzer => 'snowball', :boost => 100
      indexes :text,  :analyzer => 'snowball'
      indexes :startDate, :type => 'date'
    end
    settings :index => {
          :analysis => {
            :analyzer => {
              :default => {
                :type => 'snowball'
              }
            }
          }
        }
    def self.search(params)
      tire.search(:load => true) do
        query { string params } 
        sort  { by :startDate, 'asc' }     
      end
    end
    # END ElasticSearch setup

    def start_date
      short_date(:startDate)
    end
    def end_date
      short_date(:endDate)
    end

    def short_date(method)
      date = send(method)
      return nil if date.blank?
      parts = date.to_s.split('-')
      data = parts[0]
      if parts[1] != '01' or (parts[1] == '01' && parts[2] != '01')
        data << "-#{parts[1]}"
        if parts[2] != '01'
          data << "-#{parts[2]}"
        end
      end
      data
    end


  end
end
