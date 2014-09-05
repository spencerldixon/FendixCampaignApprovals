require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid with all attributes" do
  	user = users(:valid_user)
     assert user.valid?, "User model failed validation"
  end

  test "user fails validation with nil attributes" do
  	user = users(:nil_user)
  	assert !user.valid?, "User model returns valid with blank attributes"
  end
end
