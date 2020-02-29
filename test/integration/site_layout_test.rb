require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'staticpages/home'
    assert_select "a[href=?]", root_path, count: 1
  end
end
