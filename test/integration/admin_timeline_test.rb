require 'test_helper'

class AdminTimelineTest < ActionDispatch::IntegrationTest
  fixtures :all

  setup do
    admin_login
  end

  test 'edit an event' do
    visit(admin_timeline_keeper_event_path(timeline_keeper_events(:one)))
    assert page.has_content?('Event Headline')
    click_link('Edit Event')
    fill_in 'Headline', :with => 'Event One'
    click_button 'Update Event'
    assert page.has_content?('Event was successfully updated.')
    visit(timeline_keeper.event_path(timeline_keeper_events(:one)))
    assert page.has_content?('Event One')
  end
end

