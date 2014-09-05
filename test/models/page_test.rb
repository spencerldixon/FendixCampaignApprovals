require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "page is invalid with nil name" do
  	page = pages(:page)
  	page.name = nil
    assert !page.valid?, "Page returned valid with no name"
  end
end
