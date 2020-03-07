require 'test_helper'

class AdminAccountControllerTest < ActionDispatch::IntegrationTest
  test "api access" do
    perform_successful_login

    get '/admin/account/api_access'

    assert_response :success

    # assert_includes response.parsed_body, '10'
  end

  test "regen token" do
    perform_successful_login

    post '/admin/account/regenerate_token'

    assert_response :found

    # assert_includes response.parsed_body, '10'
  end

  test "get notifications and newsletter" do
    perform_successful_login

    get '/admin/account/notifications_and_newsletter'

    assert_response :success

    assert_includes response.parsed_body, 'Notifications'
  end

  test "change notifications and newsletter" do
    perform_successful_login

    patch '/admin/account/notifications_and_newsletter',
          params: {
            user: {
              nb_credits_threshold_notification: 50,
              newsletter: 1
            }
          }

    assert_response :found
  end
end
