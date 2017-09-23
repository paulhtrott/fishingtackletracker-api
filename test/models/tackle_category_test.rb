require "test_helper"

describe TackleCategory do
  let(:tackle_category) { FactoryGirl.create :tackle_category }

  it "must be valid" do
    value(tackle_category).must_be :valid?
  end
end
