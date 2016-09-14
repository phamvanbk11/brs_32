require 'rails_helper'

RSpec.describe "users/index", type: :view do

  let(:user1) do
    mock_model(User,
      id: 1,
      email: "user1@gmail.com",
      name: "user1",
      password: "123456",
      password_confirmation: "123456")
  end

  let(:user2) do
    mock_model(User,
      id: 2,
      email: "user2@gmail.com",
      name: "user2",
      password: "123456",
      password_confirmation: "123456")
  end

  before do
    assign(:users, Kaminari.paginate_array([user1, user2]).page(1))
    render
  end

  it "should have button search" do
    expect(response).to have_button "Search"
  end

  it "should have search field" do
    expect(response).to have_xpath "//input[@name = 'search']"
  end
  it "should show user1" do
    expect(response).to have_link user1.name
  end

  it "should show user2" do
    expect(response).to have_link user2.name
  end
end
