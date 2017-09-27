require 'test_helper'

class TackleTest < ActiveSupport::TestCase
  let(:tackle) { FactoryGirl.create :tackle }

  describe "valid" do

    it "must be valid" do
      value(tackle).must_be :valid?
    end
  end

  describe "validations" do

    describe "user_id" do

      it "should be present" do
        tackle = Tackle.create
        value(tackle.errors.messages[:user_id]).must_include "can't be blank"
      end
    end

    describe "tackle_type_id" do

      it "should be present" do
        tackle = Tackle.create
        value(tackle.errors.messages[:tackle_type_id]).must_include "can't be blank"
      end
    end

    describe "name" do

      it "should be present" do
        tackle = Tackle.create
        value(tackle.errors.messages[:name]).must_include "can't be blank"
      end
    end

    describe "size" do

      it "should be greater than or equal to 0" do
        tackle = Tackle.create(size: -1)
        value(tackle.errors.messages[:size]).must_include "must be greater than or equal to 0"
      end
    end

    describe "quantity" do

      it "should be greater than or equal to 0" do
        tackle = Tackle.create(quantity: -1)
        value(tackle.errors.messages[:quantity]).must_include "must be greater than or equal to 0"
      end
    end

    describe "length" do

      it "should be greater than or equal to 0" do
        tackle = Tackle.create(length: -1)
        value(tackle.errors.messages[:length]).must_include "must be greater than or equal to 0"
      end
    end

    describe "length_unit" do

      it "should have correct units available" do
        value(Tackle::LENGTH_UNITS).must_equal ['inch', 'centimeter', 'millimeter', 'meter', 'foot', 'yard']
      end

      it "should be a value from LENGTH UNITS if length is greater than 0" do
        tackle = Tackle.create(length_unit: 'fish', length: 1)
        value(tackle.errors.messages[:length_unit]).must_include " is not valid, must be: inch, centimeter, millimeter, meter, foot, yard"
      end

      describe "if length is 0" do

        before do
          tackle
        end

        it "length_unit should be nil" do
          tackle.update(length: 0)
          tackle.reload
          value(tackle.length_unit).must_be_nil
        end
      end
    end

    describe "weight_unit" do

      it "should have correct units available" do
        value(Tackle::WEIGHT_UNITS).must_equal ['kilogram', 'gram', 'centigram', 'milligram', 'stone', 'pound', 'ounce']
      end

      it "should be a value from WEIGHT UNITS if weight is greater than 0" do
        tackle = Tackle.create(weight_unit: 'fish', weight: 1)
        value(tackle.errors.messages[:weight_unit]).must_include " is not valid, must be: kilogram, gram, centigram, milligram, stone, pound, ounce"
      end

      describe "if weight is 0" do

        before do
          tackle
        end

        it "weight_unit should be nil" do
          tackle.update(weight: 0)
          tackle.reload
          value(tackle.weight_unit).must_be_nil
        end
      end
    end

    describe "quantity_wanted" do
      it "must be greater than or equal to zero" do
        tackle = Tackle.create(quantity_wanted: -1)
        value(tackle.errors.messages[:quantity_wanted]).must_include "must be greater than or equal to 0"
      end
    end

    describe "price" do
      it "must be greater than or equal to zero" do
        tackle = Tackle.create(price: -1)
        value(tackle.errors.messages[:price]).must_include "must be greater than or equal to 0"
      end
    end
  end

  describe "need_to_buy_more" do

    before do
      tackle
    end

    it "should return true if quantity wanted is greater than quantity" do
      tackle.update(quantity_wanted: 7, quantity: 3)
      tackle.reload
      value(tackle.need_to_buy_more?).must_equal true
    end

    it "should return false if quantity wanted is same as quantity" do
      tackle.update(quantity_wanted: 7, quantity: 7)
      tackle.reload
      value(tackle.need_to_buy_more?).must_equal false
    end

    it "should return true if quantity wanted is greater than quantity" do
      tackle.update(quantity_wanted: 1, quantity: 3)
      tackle.reload
      value(tackle.need_to_buy_more?).must_equal false
    end
  end

  describe "quantity_needed_to_buy" do

    before do
      tackle
    end

    it "should calculate correctly, if need to buy more" do
      tackle.update(quantity_wanted: 7, quantity: 3)
      tackle.reload
      value(tackle.quantity_needed_to_buy).must_equal 4
    end

    it "should return nil, if don't need to buy more" do
      tackle.update(quantity_wanted: 3, quantity: 3)
      tackle.reload
      value(tackle.quantity_needed_to_buy).must_be_nil
    end
  end

  describe "amount_spent" do

    before do
      tackle
    end

    it "should return price times quantity" do
      value(tackle.amount_spent).must_equal 5*5.49
    end
  end

  describe "amount_to_spend" do

    before do
      tackle
    end

    it "should return price times quantity_wanted" do
      value(tackle.amount_to_spend).must_equal 6*5.49
    end
  end

  describe "to_s" do

    before do
      tackle
    end

    it "should return titleized name" do
      value(tackle.to_s).must_equal "Jr Thunderstick"
    end
  end
end
