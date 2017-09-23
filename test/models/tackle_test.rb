require 'test_helper'

class TackleTest < ActiveSupport::TestCase

  describe "valid" do
    let(:tackle) { FactoryGirl.create :tackle }

    it "must be valid" do
      value(tackle).must_be :valid?
    end
  end
end
