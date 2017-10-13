module Api::V1
  class UserResponder
    include Api::ApiResponder

    delegate \
      :id, \
      :email, \
      :name, \
      :city, \
      :state, \
      :country, \
      :zipcode, \
      :created_at, \
      :updated_at, \
      :tackles, \
      to: :model

    def to_hash
      {
        id: id,
        email: email,
        name: name,
        city: city,
        state: state,
        country: country,
        zipcode: zipcode,
        created_at: json_time(created_at),
        updated_at: json_time(updated_at)
      }.merge(tackles_hash)
    end

    private

      def tackles_hash
        if tackle = tackles
          {
            tackle_count: tackle.count,
            get_tackle: Rails.application.routes.url_helpers.api_v1_user_tackle_index_path(id)
          }
        else
          { tackle: :none }
        end
      end
  end
end
