require "test_helper"

class PostulationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "create postulation and message" do
    sign_in users(:one)
    assert_difference(["Postulation.count + 1", "Message.count + 1" ]) do
      post postulations_url, params: { postulation: { why_me: "I'm the best", offer_id: offers(:one).id } }
    end
    assert_response :redirect
    asset_status 302
  end
end
