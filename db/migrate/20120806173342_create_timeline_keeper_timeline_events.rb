class CreateTimelineKeeperTimelineEvents < ActiveRecord::Migration
  def change
    create_table :timeline_keeper_timeline_events do |t|
      t.references :timeline
      t.references :event

      t.timestamps
    end
    add_index :timeline_keeper_timeline_events, :timeline_id
    add_index :timeline_keeper_timeline_events, :event_id
  end
end
