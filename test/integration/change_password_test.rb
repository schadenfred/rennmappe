require "test_helper"

feature "Change email Feature Test" do

  background do
    @user = FactoryGirl.create(:user, email: "jim.bobby@gmail.com", name: "Jimbob McBobsalot")
    login_as(@user)
    visit dashboard_path
    current_path.must_equal dashboard_path
    click_link "settings"
    current_path.must_equal "/users/edit"
    fill_in "Password", with: "newpass"
    fill_in "Password confirmation", with: "newpass"
  end

  scenario "without current password" do
    fill_in "Current password", with: "wrongpass"
    click_button "Update"
    page.must_have_selector(".alert", text: /Please review the problems below/)
    current_path.must_equal "/users"
  end

  scenario "with current password" do
    fill_in "Current password", with: @user.password
    click_button "Update"
    page.assert_selector("#flash_notice", text: /updated successfully./)
    current_path.must_equal "/dashboard"
  end
end
