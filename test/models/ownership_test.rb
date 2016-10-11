require "test_helper"

describe Ownership do

  subject { Ownership }

  describe "db" do

    specify "columns & types" do

      must_have_column(:vehicle_id, :integer)
      must_have_column(:owner_id, :integer)
      must_have_column(:ownership_begin, :date)
      must_have_column(:ownership_end, :date)
    end

    specify "indexes" do

      must_have_index([:vehicle_id, :owner_id])
    end
  end

  specify "associations" do

    must_belong_to(:owner)
    must_belong_to(:vehicle)
  end
end