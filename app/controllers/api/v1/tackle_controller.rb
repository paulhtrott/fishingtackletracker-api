class Api::V1::TackleController < Api::V1Controller

  def index
    render json: JSON.pretty_generate({ user_id: params[:user_id].to_i, tackle: Tackle.where(user_id: params[:user_id]).order(:id).as_json })
  end

  def show
    render json: JSON.pretty_generate({ user_id: params[:user_id].to_i, tackle: Tackle.where(user_id: params[:user_id], id: params[:id]).first.as_json })
  end
end
