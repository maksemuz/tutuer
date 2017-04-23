require 'test_helper'

class TutuerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutuer_index_url
    assert_response :success
  end

end
