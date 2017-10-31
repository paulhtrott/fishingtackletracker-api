class Api::V1::TackleController < Api::V1Controller

  def index
    render_json Api::V1::TackleResponder.to_hash(User.find_by!(id: params[:user_id]).tackles.order(:id))
  end

  def show
    render_json Api::V1::TackleResponder.to_hash(User.find_by!(id: params[:user_id]).tackles.find_by!(id: params[:id]))
  end

  def create
    user = User.find_by!(id: params[:user_id])
    user.tackles.create!(create_params)
    render_json Api::V1::TackleResponder.to_hash(user.tackles)
  end

  def update
    tackle = Tackle.find_by!(id: params[:id])
    tackle.update(update_params)
    render_json Api::V1::TackleResponder.to_hash(tackle)
  end

  private

    def update_params
      params.require(:tackle).permit(
          :name,
          :description,
          :size,
          :quantity,
          :color
      )
    end

    def create_params
      params.permit(tackle:
        [
          :name,
          :description,
          :size,
          :quantity,
          :color,
          :model_number,
          :shape,
          :length,
          :weight,
          :brand,
          :quantity_wanted,
          :price,
          :length_unit,
          :weight_unit,
          :tackle_type_id
        ]
      )[:tackle]
    end
end
