require "test_helper"

describe ChecksController do

  Given(:user) { FactoryGirl.create(:user) }
  Given(:check) { FactoryGirl.create(:check) }
  Given { sign_in user }


  describe "#show" do
  Given(:actual) { JSON.parse(response.body) }
  Given(:expected) { json_fixture }

    Given { get check_url(check) }
    Then  { value(response.must_be :success? ) }
    And   { assert_equal actual.keys, expected.keys }
  end

  describe "#index" do

    Given { check }
    Given(:actual) { JSON.parse(response.body) }
    Given(:expected) { json_fixture }
    Given { get checks_path }
    # Then { value(response.must_be :success? ) }
    Then { assert_equal actual.first.keys, expected.first.keys }
  end


  # it "gets index" do
  #   get checks_url
  #   value(response).must_be :success?
  # end

  # it "gets new" do
  #   get new_check_url
  #   value(response).must_be :success?
  # end

  # it "creates check" do
  #   expect {
  #     post checks_url, params: { check: {  } }
  #   }.must_change "Check.count"

  #   must_redirect_to check_path(Check.last)
  # end

  # it "shows check" do
  #   get check_url(check)
  #   value(response).must_be :success?
  # end

  # it "gets edit" do
  #   get edit_check_url(check)
  #   value(response).must_be :success?
  # end

  # it "updates check" do
  #   patch check_url(check), params: { check: {  } }
  #   must_redirect_to check_path(check)
  # end

  # it "destroys check" do
  #   expect {
  #     delete check_url(check)
  #   }.must_change "Check.count", -1

  #   must_redirect_to checks_path
  # end
end
