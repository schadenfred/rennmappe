require "test_helper"

feature "Authentication Feature Test" do

  scenario "Sign up from nav modal" do
    visit root_path
    click_link "Sign up"
    current_path.must_equal new_user_registration_path
    fill_in 'user_email', with: 'kiran.hill@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    assert_difference('ActionMailer::Base.deliveries.count') do
      click_button 'Sign up'
    end
    User.last.email.must_equal "kiran.hill@gmail.com"
    page.must_have_selector("#flash_notice", text: /confirmation link has been sent/)
    open_email 'kiran.hill@gmail.com'
    current_email.subject.must_equal "Please confirm your account"
    current_email.from.first.must_equal "gunther@rennmappe.de"
    current_email.body.must_match(/Wilkommen Kiran!/)
    current_email.click_link "Confirm my account"
    page.must_have_selector("#flash_notice", text: /successfully confirmed/)
    current_path.must_equal new_user_session_path
  end
end

