require "test_helper"

describe User do
  let(:user) { FactoryGirl.create :user }

  it "must be valid" do
    value(user).must_be :valid?
  end

  describe "validations" do

    describe "email" do

      it "should be present" do
        user = User.create
        value(user.errors.messages[:email]).must_include "can't be blank"
      end

      it "should be a valid email" do
        user = User.create(email: 'fish.com')
        value(user.errors.messages[:email]).must_include "is invalid"
      end

      describe "unique" do

        before do
          user
        end

        it "should be unique" do
          new_user = User.create(email: user.email)
          value(new_user.errors.messages[:email]).must_include "has already been taken"
        end
      end
    end
  end
end
