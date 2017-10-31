require "test_helper"

describe Api::V1::UsersController do
  let(:user) { FactoryGirl.create :user }

  describe "GET :show" do
    it "should get the requested user" do
      get api_v1_user_path(user.id)
      assert_response :success
      json = JSON.parse(response.body).deep_symbolize_keys
      value(json[:id]).must_equal user.id
      value(json[:email]).must_equal user.email
    end
  end

  describe "PATCH :update" do
    it "should update the user" do
      patch api_v1_user_path(user.id), params: { user: {name: "paul henry"}}
      assert_response :success
      json = JSON.parse(response.body).deep_symbolize_keys
      value(json[:id]).must_equal user.id
      value(json[:name]).must_equal "paul henry"
    end
  end
end
