class Api::V1::UsersController < Api::V1Controller

  def show
    render_json User.find(params[:id])
  end
end
