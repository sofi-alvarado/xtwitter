require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      name: "Name",
      username: "Username",
      bio: "Bio",
      location: "Location",
      link: "Link",
      email: "Email",
      password: "Password",
      lastname: "Lastname"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Bio/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Lastname/)
  end
end
