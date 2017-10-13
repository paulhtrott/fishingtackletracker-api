require "test_helper"

describe Api::V1::TackleController do
  let(:tackle) { FactoryGirl.create :tackle }

  describe "GET :index" do
    it "should get the requested user's tackle" do
      get api_v1_user_tackle_index_path(tackle.user.id)
      assert_response :success
      json = JSON.parse(response.body).deep_symbolize_keys
      value(json[:tackles][0][:id]).must_equal tackle.id
    end
  end

  describe "GET :show" do
    it "should get the requested user's specfic tackle" do
      get api_v1_user_tackle_path(tackle.user.id, tackle.id)
      assert_response :success
      json = JSON.parse(response.body).deep_symbolize_keys
      value(json[:id]).must_equal tackle.id
    end
  end
end
