ActiveAdmin.register TimelineKeeper::Event do
  form do |f|
    f.inputs :headline, :start_at, :end_at, :text, :media, :credit, :caption, 
      :thumbnail, :timelines

    f.buttons
  end
end
