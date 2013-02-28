class CreateTimelineKeeperEvents < ActiveRecord::Migration
  def change
    create_table :timeline_keeper_events, :id => false do |t|
      t.integer  :id, :limit => 8, :null => false
      t.string :headline
      t.datetime :start_at
      t.datetime :end_at
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
