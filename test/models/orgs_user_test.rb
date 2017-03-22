require "test_helper"

describe OrgsUser do

  subject { OrgsUser }


  describe "db" do

    specify "columns & types" do

      must_have_column(:org_id, :integer)
      must_have_column(:user_id, :integer)
    end
  end

  specify "associations" do

    must_belong_to(:org)
    must_belong_to(:user)
  end
end
