require "test_helper"

feature "Position Feature Test" do

  let(:user) { create(:user) }
  let(:winery) { create(:winery) }

  scenario "add position to user and org" do

    login_as user
    visit dashboard_path

    within("#positions") do
      fill_in "Job or position title", with: "HMFIC"
      fill_in "Organization", with: winery.id
      click_button "create a new position"
    end

    user.reload.positions.last.positionable.must_equal winery
    page.assert_selector(".alert", text: /positions updated/)
  end
end

