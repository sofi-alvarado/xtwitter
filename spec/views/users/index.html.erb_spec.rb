require 'rails_helper'
=begin
RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        name: "Name",
        username: "Username",
        bio: "Bio",
        location: "Location",
        link: "Link",
        email: "Email",
        password: "Password",
        lastname: "Lastname"
      ),
      User.create!(
        name: "Name",
        username: "Username",
        bio: "Bio",
        location: "Location",
        link: "Link",
        email: "Email",
        password: "Password",
        lastname: "Lastname"
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Bio".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Location".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Link".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Password".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Lastname".to_s), count: 2
  end
end
=end