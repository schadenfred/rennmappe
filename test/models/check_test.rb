require "test_helper"

describe Check do

  subject { Check }

  describe "db" do

    specify "columns & types" do

      must_have_column(:name)
      must_have_column(:description)
      must_have_column(:parent_id, :integer)
      must_have_column(:org_id, :integer)
      must_have_column(:author_id, :integer)
      must_have_column(:required, :boolean)
      must_have_column(:internal_check, :boolean)
    end

    specify "indexes" do

      must_have_index :parent_id
      must_have_index :name
      must_have_index :org_id
      must_have_index :author_id
    end
  end

  specify "associations" do

    must_belong_to :org
    must_have_many :sub_checks
  end

  Given(:org) { FactoryGirl.create(:org) }

  Given(:check) { org.checks.create(FactoryGirl.attributes_for(:check) ) }
  Given(:sub_check) { check.sub_checks.create(name: "odometer check") }

  describe "must recursively find parent_org" do

    Then { check.org.name.must_equal org.name}
    And  { sub_check.parent_org.name.must_equal org.name}
  end

  context "tick methods" do

    # Given(:check) { FactoryGirl.create(:check_with_ticks) }
    # Given(:unrelated_tick) { FactoryGirl.create(:tick, aasm_state: "failed") }
    # Given(:assignment_id) { check.ticks.first.assignment_id }

    context "responds to :ticks_assignment(assignment_id)" do

      # Given(:ticked) { check.ticks_assignment(assignment_id) }

      # Then { ticked.count.must_equal 5 }

      # And { ticked.wont_include unrelated_tick }
      # And { Tick.count.must_equal 6 }
    end

    describe ":assignment_status(assignment)" do

      context ":waiting" do

        # Then { check.assignment_status(assignment_id).must_equal "waiting" }

      end

      context ":passed" do

        # When { check.ticks.last.update(aasm_state: "passed") }
        # Then { check.assignment_status(assignment_id).must_equal "passed" }
      end

      context ":failed" do

        # Given { check.ticks.last.update(aasm_state: "failed") }
        # Then { check.assignment_status(assignment_id).must_equal "failed" }
      end
    end
  end
end
