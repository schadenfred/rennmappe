require 'test_helper'

describe Org do

  subject { Org }

  describe "db" do

    specify "columns & types" do

      must_have_column(:name, :string)
      must_have_column(:slug, :string)
    end

    specify "indexes" do

      must_have_index(:name)
      must_have_index(:slug)
    end
  end

  specify "associations" do

    must_have_many(:checks)
    must_have_many(:users)
    must_have_many(:orgs_users)
  end
end