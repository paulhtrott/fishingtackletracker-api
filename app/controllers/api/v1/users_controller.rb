class Api::V1::UsersController < Api::V1Controller

  def show
    render_json Api::V1::UserResponder.to_hash(User.find_by!(id: params[:id]))
  end

  def update
    user = User.find_by!(id: params[:id])
    user.update(user_params)
    render_json Api::V1::UserResponder.to_hash(user)
  end

  private

    def user_params
      params.require(:user).permit(
        :email,
        :name,
        :address_one,
        :address_two,
        :city,
        :state,
        :country,
        :zipcode
      )
    end
end
