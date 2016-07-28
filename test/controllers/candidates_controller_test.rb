require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get candidates_new_url
    assert_response :success
  end

end
