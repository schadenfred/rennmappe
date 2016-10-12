require "test_helper"

feature "Reset Password Feature Test" do

  let(:user) { create(:user) }

  scenario "unathenticated user resets from signin page" do
    visit new_user_session_path
    click_link "Forgot your password?"
    fill_in 'user_email', with: user.email
    click_button "Send me reset password instructions"
    page.assert_selector(".alert", text: /You will receive an email with instructions on how to reset your password in a few minutes./)
    open_email(user.email).click_link "Change my password"
    fill_in "New password", with: "newpassword"
    fill_in "Confirm new password", with: "newpassword"
    click_button "Change my password"
    page.assert_selector(".alert", text: /Your password has been changed successfully. You are now signed in./)
  end
end
