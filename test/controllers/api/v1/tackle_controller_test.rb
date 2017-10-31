require "test_helper"

describe Api::V1::TackleController do
  let(:tackle) { FactoryGirl.create :tackle }

  def tackle_params
    {
      tackle: [
        {
          name: "mr. curly",
          color: "orange",
          tackle_type_id: tackle.tackle_type_id,
          quantity: 5,
          quantity_wanted: 10
        }
      ]
    }
  end

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

  describe "PATCH :update" do
    it "should update the tackle" do
      patch api_v1_user_tackle_path(tackle.user.id, tackle.id), params: { tackle: tackle_params[:tackle][0] }
      assert_response :success
      json = JSON.parse(response.body).deep_symbolize_keys
      value(json[:id]).must_equal tackle.id
      value(json[:name]).must_equal "mr. curly"
      value(json[:quantity]).must_equal 5
    end
  end

  describe "POST :create" do
    it "should create the tackle" do
      post api_v1_user_tackle_index_path(tackle.user.id), params: tackle_params
      assert_response :success
      json = JSON.parse(response.body).deep_symbolize_keys
      value(json[:tackles].first[:name]).must_equal "mr. curly"
      value(json[:tackles].first[:quantity]).must_equal 5
      value(json[:tackles].first[:color]).must_equal "orange"
    end
  end
end
