require "test_helper"

feature "Authentication Feature Test" do

  scenario "Sign up from nav modal" do
    visit "/"
    within "#sign-up-form" do
      fill_in 'user_email', with: 'test@test.com'
    end
    find_button('Sign up').click
    User.where(email: "test@test.com").wont_be_nil
    open_email('test@test.com')
    current_email.click_link "Confirm my account"
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Activate'
  end
end

# #   scenario "Sign up with facebook" do
# #     skip
# #     OmniAuth.config.test_mode = true
# #     OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
# #       provider: 'facebook',
# #       uid: '123545',
# #       info: {
# #         nickname: "fredtasticvoyager",
# #         email: "fred.schoeneman@gmail.com",
# #         first_name: "Fred",
# #         last_name: "Schoeneman",
# #         name: "Fred Schoeneman",
# #         urls: {
# #           Facebook: "https://www.facebook.com/fredtasticvoyager"
# #         },
# #         location: "Oakland, California"
# #       }
# #     })
# #     # request.env["devise.mapping"] = Devise.mappings[:user]
# #     # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]

# #     visit user_omniauth_authorize_path(:facebook)

# #     page.must have_selector(".alert-box", text: /Signed in with Facebook/)
# #   end

# #   scenario "sign up with twitter" do

# #   end

# #   scenario "sign up with linkedin" do

# #   end

# #   scenario "sign up with instagram" do

# #   end

# #   scenario "sign up with pinterest" do

# #   end

# #   scenario "confirm account" do

# #   end
# # end