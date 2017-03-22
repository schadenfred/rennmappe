require "test_helper"

describe DashboardController do

  Given(:user) { FactoryGirl.create(:user) }

  describe "#show for" do

    describe "authenticated user" do

      Given { sign_in user }
      Given { get dashboard_show_url }

      Then { value(response).must_be :success? }
    end

    describe "logged out user" do

      Given { get dashboard_show_url }

      Then { assert_redirected_to new_user_session_path  }
    end
  end
end
