class Api::V1::TackleController < Api::V1Controller

  def index
    render_json Tackle.where(user_id: params[:user_id]).order(:id)
  end

  def show
    render_json Tackle.where(user_id: params[:user_id], id: params[:id])
  end
end
