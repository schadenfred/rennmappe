require 'test_helper'

describe Vehicle do

  subject { Vehicle }

  describe "db" do

    specify "columns & types" do

      must_have_column :vin
      must_have_column :make
      must_have_column :model
      must_have_column(:year, :integer)
    end
  end
end