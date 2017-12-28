require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get catalog_url
    assert_response :success
    assert_select 'nav.side-nav li', minimum: 2
    assert_select 'h3', 'Title_0'
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
