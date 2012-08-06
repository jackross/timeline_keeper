module TimelineKeeper
  module ApplicationHelper
    include ::TimelineKeeperHelper
    def external_media_url(event)
      url_for_external_media(event)
    end
  end
end
