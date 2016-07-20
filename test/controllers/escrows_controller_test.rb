require 'test_helper'

class EscrowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get escrows_new_url
    assert_response :success
  end

end
