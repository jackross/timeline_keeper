module TimelineKeeper
  class Event < ActiveRecord::Base
    attr_accessible :caption, :credit, :endDate, :headline, :media, :media_filename, :startDate, :text, :thumbnail

    has_many :timeline_events
    has_many :timelines, :through => :timeline_events


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
