require "test_helper"

describe TackleType do
  let(:tackle_type) { FactoryGirl.create :tackle_type }

  it "must be valid" do
    value(tackle_type).must_be :valid?
  end
end
