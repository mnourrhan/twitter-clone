require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template "users/show"
    assert_select "title", full_title(@user.name)
    assert_select "h1", text: @user.name
    assert_select "h1>img.gravatar"
    # We care that count is displayed on somewhere on the body
    # So we use response.body to make sure that the actual count match the displayed count
    assert_match @user.microposts.count.to_s, response.body
    assert_select "div.pagination"
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end
