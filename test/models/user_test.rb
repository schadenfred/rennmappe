require "test_helper"

describe User do

  subject { User }

  describe "db" do

    specify "columns & types" do

      must_have_column(:bio, :text)
      must_have_column(:confirmation_sent_at, :datetime)
      must_have_column(:confirmation_token)
      must_have_column(:confirmed_at, :datetime)
      must_have_column(:current_sign_in_at, :datetime)
      must_have_column(:current_sign_in_ip, :inet)
      must_have_column(:email)
      must_have_column(:encrypted_password)
      must_have_column(:last_sign_in_at, :datetime)
      must_have_column(:name)
      must_have_column(:given_name)
      must_have_column(:remember_created_at, :datetime)
      must_have_column(:reset_password_sent_at, :datetime)
      must_have_column(:reset_password_token)
      must_have_column(:sign_in_count, :integer)
    end

    specify "indexes" do

      must_have_index(:email)
      must_have_index(:name)
      must_have_index(:reset_password_token)
    end
  end

  specify "associations" do

    must_have_many(:ownerships)
    must_have_many(:orgs)
    must_have_many(:orgs_users)
    must_have_many(:vehicles)
  end

  describe "accepts_nested_attributes" do

    Given(:user_attrs) { FactoryGirl.attributes_for(:user) }
    Given(:vehicle) { FactoryGirl.create(:vehicle) }
    Given(:ownership_attrs) { FactoryGirl.attributes_for(:ownership ) }
    Given(:vehicle_attrs) { FactoryGirl.attributes_for(:vehicle)}

    describe "create user" do

      Given(:attrs) { user_attrs }

      Then { assert_difference("User.count") { User.create(attrs) } }
    end

    describe "create nested ownerships" do

      Given(:attrs) { user_attrs.merge(ownerships_attributes: [
        ownership_attrs.merge(vehicle_id: vehicle.id)])}

      Then do
        assert_difference(["User.count", "Ownership.count"]) do
          user = User.create(attrs)
        end
      end
    end

    describe "create nested vehicle" do

      Given(:attrs) { user_attrs.merge( ownerships_attributes: [
        ownership_attrs.merge(
              vehicle_attributes: FactoryGirl.attributes_for(:vehicle) ) ] ) }

      Then { assert_difference( [
        "User.count", "Ownership.count", "Vehicle.count"]) {
          user = User.create(attrs) } }

    end
  end

  describe "names" do

    Given(:user) { FactoryGirl.build(:user) }

    describe ".temporary_name when localpart of the email" do

      describe "is all alphabet letters" do

        Given { user.update(email: "kiranhill@gmail.com") }
        Then  { user.temporary_name.must_equal "Driver" }
        And   { user.temporary_given_name.must_equal "Driver" }
      end

      describe "is split by a period" do

        Given { user.update(email: "kiran.hill@gmail.com") }
        Then  { user.temporary_name.must_equal "Kiran Hill" }
        And   { user.temporary_given_name.must_equal "Kiran" }
      end

      describe "is split by an underscore" do

        Given { user.update(email: "kiran_hill@gmail.com") }
        Then  { user.temporary_name.must_equal "Kiran Hill" }
        And   { user.temporary_given_name.must_equal "Kiran" }
      end

      describe "is split by single digit number" do

        Given { user.update(email: "kiran9hill@gmail.com") }
        Then  { user.temporary_name.must_equal "Kiran Hill" }
        And   { user.temporary_given_name.must_equal "Kiran" }
      end

      describe "has a multiple digit number" do

        Given { user.update(email: "kiran69hill@gmail.com") }
        Then  { user.temporary_name.must_equal "Kiran Hill" }
        And   { user.temporary_given_name.must_equal "Kiran" }
      end

      describe "is ended by a single digit number" do

        Given { user.update(email: "superman9@gmail.com") }
        Then  { user.temporary_name.must_equal "Driver" }
        And  { user.temporary_given_name.must_equal "Driver" }
      end
    end

    describe ".reconciled_name" do

      describe "when :name is nil but :given_name is set" do

        Given { user.update(email: "superman9@gmail.com", name: nil, given_name: "superman") }
        Then  { user.reconciled_name.must_equal "superman" }
        And   { user.reconciled_given_name.must_equal "superman" }
      end

      describe "when :name and :given_name are nil" do
        Given { user.update(email: "superman9@gmail.com", name: nil, given_name: nil) }
        Then  { user.reconciled_name.must_equal "Driver" }
        And   { user.reconciled_given_name.must_equal "Driver" }
      end

      describe "when :name is set but :given_name is nil" do
        Given { user.update(email: "superman9@gmail.com", name: "clark kent", given_name: nil) }
        Then  { user.reconciled_name.must_equal "clark kent" }
        And   { user.reconciled_given_name.must_equal "clark" }
      end

      describe "when :name and :given_name are set" do
        Given { user.update(email: "superman9@gmail.com", name: "clark kent", given_name: "superman") }
        Then  { user.reconciled_name.must_equal "clark kent" }
        And   { user.reconciled_given_name.must_equal "superman" }
      end
    end
  end
end

