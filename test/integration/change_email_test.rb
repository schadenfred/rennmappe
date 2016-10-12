require "test_helper"

feature "Change email Feature Test" do

  before do
    @user = FactoryGirl.create(:user, email: "jim.bobby@gmail.com", name: "Jimbob McBobsalot")
    login_as(@user)
    visit dashboard_path
  end

  scenario "from dashboard settings" do

    within("#settings") do
      fill_in "Email", with: "James.Robert@gmail.com"
      fill_in "Current password", with: @user.password
      click_button "Update"
    end
    open_email("james.robert@gmail.com").click_link "Confirm my account"
    fill_in "Email", with: "James.Robert@gmail.com"
    fill_in "Password", with: @user.password
    click_button "Sign in"
    page.assert_selector(".alert", text: /Signed in successfully/)
  end
end
