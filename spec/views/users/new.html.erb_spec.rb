require 'rails_helper'
=begin
RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      name: "MyString",
      username: "MyString",
      bio: "MyString",
      location: "MyString",
      link: "MyString",
      email: "MyString",
      password: "MyString",
      lastname: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

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
