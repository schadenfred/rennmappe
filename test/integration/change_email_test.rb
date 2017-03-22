require "test_helper"

feature "Change email Feature Test" do

  before do
    @user = FactoryGirl.create(:user, email: "jim.bobby@aol.com", name: "Jimbob McBobsalot")
    login_as(@user)
    visit dashboard_path
  end

  scenario "from dashboard settings" do
    click_link "settings"
    fill_in "Email", with: "jim.bobby@gmail.com"
    fill_in "Current password", with: @user.password
    assert_difference('ActionMailer::Base.deliveries.count') do
      click_button "Update"
    end
    page.assert_selector("#flash_notice", text: /need to verify your new/)
    open_email "jim.bobby@gmail.com"
    current_email.subject.must_equal "Please confirm your account"
    current_email.from.first.must_equal "gunther@rennmappe.de"
    current_email.click_link "Confirm my account"
  end
end
