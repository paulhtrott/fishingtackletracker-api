require "test_helper"

describe TackleType do
  let(:tackle_type) { FactoryGirl.create :tackle_type }

  it "must be valid" do
    value(tackle_type).must_be :valid?
  end

  describe "validations" do

    describe "name" do

      it "should be present" do
        tackle_type = TackleType.create
        value(tackle_type.errors.messages[:name]).must_include "can't be blank"
      end

      describe "unique" do

        before do
          tackle_type
        end

        it "should be unique" do
          new_tackle_type = TackleType.create(name: tackle_type.name)
          value(new_tackle_type.errors.messages[:name]).must_include "has already been taken"
        end
      end
    end
  end
end
