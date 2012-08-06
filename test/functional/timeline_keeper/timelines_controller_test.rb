require 'test_helper'

module TimelineKeeper
  class TimelinesControllerTest < ActionController::TestCase
    test "should get index" do
      get :index, :use_route => :timeline_keeper
      assert_response :success
    end
  
    test "should get show" do
      get :show, :id => timeline_keeper_timelines(:one) , :use_route => :timeline_keeper
      assert_response :success
    end
  
  end
end
