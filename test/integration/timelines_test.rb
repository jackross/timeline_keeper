require 'test_helper'

class TimelinesTest < ActionDispatch::IntegrationTest
  fixtures :all

  test 'timeline with an event without an endDate should display' do 
    visit(timeline_keeper.timeline_path(timeline_keeper_timelines(:two)))
    assert page.has_content?('Event Three')
  end
end

