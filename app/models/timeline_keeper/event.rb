module TimelineKeeper
  class Event < ActiveRecord::Base
    attr_accessible :caption, :credit, :end_at, :headline, 
      :media, :media_filename, :start_at, :text, :thumbnail, :timeline_ids

    has_many :timeline_events
    has_many :timelines, :through => :timeline_events

    validates :start_at, :headline, :presence => true

    # ElasticSearch setup
    include Tire::Model::Search
    include Tire::Model::Callbacks

    mapping do
      indexes :id, :index => :not_analyzed    
      indexes :media_filename, :index => :not_analyzed
      indexes :headline, :analyzer => 'snowball', :boost => 100
      indexes :text, :analyzer => 'snowball'
      indexes :start_at, :type => 'date'
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
        sort  { by :start_at, 'asc' }     
      end
    end
    # END ElasticSearch setup

    def start_date
      start_at.strftime("%Y-%m-%d")
      # short_date(:start_at)
    end

    def end_date
      end_at ? end_at.strftime("%Y-%m-%d") : nil
      # short_date(:end_at)
    end

    def short_date(method)

      date = send(method)
      return nil if date.blank?
      parts = date.to_date.to_s.split('-')
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
