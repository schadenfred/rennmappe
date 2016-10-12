require "test_helper"

feature "Authentication Feature Test" do

  let(:user) { create( :user, password: "password" ) }


  scenario "Sign in" do
    visit root_url
    page.has_link?("Sign in")
    within '#sign-in-form' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find_button("sign in").click
    end
    page.has_current_path?(dashboard_path)
    click_link "sign out"
    page.has_current_path?("/")
    save_and_open_page
    page.assert_selector(".alert", text: /Signed out successfully./)
  end
end
