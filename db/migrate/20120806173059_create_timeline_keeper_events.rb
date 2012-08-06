class CreateTimelineKeeperEvents < ActiveRecord::Migration
  def change
    create_table :timeline_keeper_events do |t|
      t.string :headline
      t.datetime :startDate
      t.datetime :endDate
      t.text :text
      t.string :media
      t.string :credit
      t.string :caption
      t.string :thumbnail
      t.string :media_filename

      t.timestamps
    end
  end
end
