require "test_helper"

feature "Change email Feature Test" do

  before do
    @user = FactoryGirl.create(:user, email: "jim.bobby@gmail.com", name: "Jimbob McBobsalot")
    login_as(@user)
    visit dashboard_path
  end

  scenario "from dashboard settings" do

    within("#settings") do
      fill_in "Password", with: "complicatedpass"
      fill_in "Password confirmation", with: "complicatedpass"

      fill_in "Current password", with: @user.password
      click_button "Update"
    end
    click_link "sign out #{@user.email}"
    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "complicatedpass"
    click_button "Sign in"
    page.assert_selector(".alert", text: /Signed in successfully./)
  end
end
