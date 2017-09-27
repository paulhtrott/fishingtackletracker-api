require "test_helper"

describe TackleCategory do
  let(:tackle_category) { FactoryGirl.create :tackle_category }

  it "must be valid" do
    value(tackle_category).must_be :valid?
  end

  describe "validations" do

    describe "name" do

      it "should be present" do
        tackle_category = TackleCategory.create
        value(tackle_category.errors.messages[:name]).must_include "can't be blank"
      end

      describe "unique" do

        before do
          tackle_category
        end

        it "should be unique" do
          new_tackle_category = TackleCategory.create(name: tackle_category.name)
          value(new_tackle_category.errors.messages[:name]).must_include "has already been taken"
        end
      end
    end
  end
end
