require 'test_helper'

class MessagesSecondsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get messages_seconds_create_url
    assert_response :success
  end

end
