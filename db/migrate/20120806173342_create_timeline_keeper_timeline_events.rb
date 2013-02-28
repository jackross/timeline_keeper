class CreateTimelineKeeperTimelineEvents < ActiveRecord::Migration
  def change
    create_table :timeline_keeper_timeline_events do |t|
      t.integer  :timeline_id, :limit => 4, :null => false
      t.integer  :event_id, :limit => 8, :null => false

      t.timestamps
    end
    add_index :timeline_keeper_timeline_events, :timeline_id
    add_index :timeline_keeper_timeline_events, :event_id
  end
end
