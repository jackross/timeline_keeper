ActiveAdmin.register TimelineKeeper::Event do
  form do |f|
    f.inputs :headline, :startDate, :endDate, :text, :media, :credit, :caption, 
      :thumbnail, :timelines

    f.buttons
  end
end
