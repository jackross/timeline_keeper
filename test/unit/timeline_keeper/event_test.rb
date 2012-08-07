require 'test_helper'

module TimelineKeeper
  class EventTest < ActiveSupport::TestCase
    
    setup do
      @event = Event.new(:startDate => DateTime.now)
    end

    test "Event without a startDate should be invalid" do
      event = timeline_keeper_events(:one)
      assert event.valid?
      event.startDate = nil
      assert_false event.valid?
    end

    test "start_date should be short form of startDate" do 
      @event.startDate = DateTime.new(2000, 3, 7)
      assert_equal '2000-03-07', @event.start_date
    end

    test 'start_date should be year and month if day is the first' do
      @event.startDate = DateTime.new(2000, 3, 1)
      assert_equal '2000-03', @event.start_date
    end

    test 'start_date should be year if month and day are the first' do
      @event.startDate = DateTime.new(2000, 1, 1)
      assert_equal '2000', @event.start_date
    end

    test 'start_date should be year-month-day if month is 1 and day is not 1' do
      @event.startDate = DateTime.new(2000, 1, 2)
      assert_equal '2000-01-02', @event.start_date
    end

  end
end
