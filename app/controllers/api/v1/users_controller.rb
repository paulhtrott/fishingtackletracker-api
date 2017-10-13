class Api::V1::UsersController < Api::V1Controller

  def show
    render_json Api::V1::UserResponder.to_hash(User.find_by!(id: params[:id]))
  end
end
