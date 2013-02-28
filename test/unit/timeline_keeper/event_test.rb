require 'test_helper'

module TimelineKeeper
  class EventTest < ActiveSupport::TestCase
    
    setup do
      @event = Event.new(:start_at => DateTime.now)
    end

    test "Event without a start_at should be invalid" do
      event = timeline_keeper_events(:one)
      assert event.valid?
      event.start_at = nil
      assert_false event.valid?
    end

    test "event without a headline should be invalid" do
      event = timeline_keeper_events(:one)
      event.headline = nil
      assert_false event.valid?
    end

    test "start_date should be short form of start_at" do 
      @event.start_at = DateTime.new(2000, 3, 7)
      assert_equal '2000-03-07', @event.start_date
    end

    test 'start_date should be year and month if day is the first' do
      @event.start_at = DateTime.new(2000, 3, 1)
      assert_equal '2000-03', @event.start_date
    end

    test 'start_date should be year if month and day are the first' do
      @event.start_at = DateTime.new(2000, 1, 1)
      assert_equal '2000', @event.start_date
    end

    test 'start_date should be year-month-day if month is 1 and day is not 1' do
      @event.start_at = DateTime.new(2000, 1, 2)
      assert_equal '2000-01-02', @event.start_date
    end

    test 'event with no end_at should return nil for end_date' do 
      @event.end_at = nil
      assert_nil @event.end_date
    end

  end
end
