require "test_helper"

feature "Reset Password Feature Test" do

  let(:user) { create(:user) }

  scenario "unathenticated user resets from signin page" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    click_link "Forgot your password?"
    fill_in 'user_email', with: user.email
    assert_difference('ActionMailer::Base.deliveries.count') do
      click_button "Send me reset password instructions"
    end
    current_path.must_equal new_user_session_path
    page.assert_selector(".alert", text: /You will receive an email with instructions on how to reset your password in a few minutes./)
    open_email(user.email)
    current_email.subject.must_equal "Reset password instructions"
    current_email.click_link "Change my password"
    current_path.must_equal edit_user_password_path
    fill_in "New password", with: "newpassword"
    fill_in "Confirm your new password", with: "newpassword"
    click_button "Change my password"
    page.assert_selector(".alert", text: /Your password has been changed successfully. You are now signed in./)
  end
end
