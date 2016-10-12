require "test_helper"

feature "Invitation Feature Test" do

  before do
    @user = FactoryGirl.create(:user, email: "jim.bobby@gmail.com", name: "Jimbob McBobsalot")
    login_as(@user)
    visit dashboard_path
  end

  scenario "without name" do

    within("#invitations") do
      fill_in "Email", with: "Narcy.david@gmail.com"
      click_button "Send an invitation"
    end
    @user.reload.invitation_limit.must_equal 4
    open_email("narcy.david@gmail.com")
    current_email.body.must_match "#{@user.name} thinks you would be a fun"
    current_email.body.must_match "Hi Narcy,"
    current_email.click_link "Accept invitation"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Set my password"
    page.assert_selector(".alert", text: /Your password was set successfully. You are now signed in./)
  end

  scenario "without name" do

    within("#invitations") do
      fill_in "Email", with: "Narcy.david@gmail.com"
      fill_in "Name", with: "Narciso davidovich"
      click_button "Send an invitation"
    end
    open_email("narcy.david@gmail.com")
    current_email.body.must_match "Hi Narciso,"
  end
end
