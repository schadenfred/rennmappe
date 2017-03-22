require "test_helper"

feature "Authentication Feature Test" do

  before do
    @user = FactoryGirl.create(:user)
  end

  scenario "Sign in and sign out" do
    visit root_url
    click_link "Sign in"
    current_path.must_equal new_user_session_path
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button 'Log in'
    current_path.must_equal dashboard_path
    page.must_have_selector("#flash_notice", text: /Signed in/)
    click_link "sign out"
    page.must_have_selector("#flash_notice", text: /Signed out/)
    current_path.must_equal root_path
  end
end
