require "test_helper"

describe Check do
  let(:check) { Check.new }

  it "must be valid" do
    value(check).must_be :valid?
  end
end
