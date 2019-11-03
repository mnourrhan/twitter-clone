require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    #  recording the user count, posting the data, and verifying that the count is the same
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "", email: "user@invalid",
                                         password: "foo",password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "User Example",
                                         email: "user@valid.com",
                                         password: "foobar",
                                         password_confirmation: "foobar" } }
    end
    # test that after finishing the page will redirect
    follow_redirect!
    assert_template 'users/show'
  end

end
