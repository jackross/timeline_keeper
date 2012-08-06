module TimelineKeeper
  class TimelineEvent < ActiveRecord::Base
    belongs_to :timeline
    belongs_to :event
    # attr_accessible :title, :body
  end
end
