require 'test_helper'

module TimelineKeeper
  class EventTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end

    test "Event without a startDate should be invalid" do
      event = timeline_keeper_events(:one)
      assert event.valid?
      event.startDate = nil
      assert_false event.valid?
    end
  end
end
