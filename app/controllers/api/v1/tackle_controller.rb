class Api::V1::TackleController < Api::V1Controller

  def index
    render_json Api::V1::TackleResponder.to_hash(User.find_by!(id: params[:user_id]).tackles.order(:id))
  end

  def show
    render_json Api::V1::TackleResponder.to_hash(User.find_by!(id: params[:user_id]).tackles.find_by!(id: params[:id]))
  end
end
