require 'rails_helper'
=begin
RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      name: "MyString",
      username: "MyString",
      bio: "MyString",
      location: "MyString",
      link: "MyString",
      email: "MyString",
      password: "MyString",
      lastname: "MyString"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[bio]"

      assert_select "input[name=?]", "user[location]"

      assert_select "input[name=?]", "user[link]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[lastname]"
    end
  end
end
=end