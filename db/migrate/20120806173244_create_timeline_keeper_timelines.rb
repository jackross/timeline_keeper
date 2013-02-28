class CreateTimelineKeeperTimelines < ActiveRecord::Migration
  def change
    create_table :timeline_keeper_timelines do |t|
      t.string :headline
      t.datetime :start_at
      t.text :text
      t.string :media
      t.string :credit
      t.string :caption

      t.timestamps
    end
  end
end
