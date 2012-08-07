module TimelineKeeperHelper

  def url_for_external_media(event)
    "http://d.lib.ncsu.edu/collections/catalog/#{event.media_filename}"
  end

end