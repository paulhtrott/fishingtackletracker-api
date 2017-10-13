module Api::V1
  class TackleResponder
    include Api::ApiResponder

    delegate \
      :id, \
      :name, \
      :description, \
      :size, \
      :quantity, \
      :color, \
      :model_number, \
      :shape, \
      :length_text, \
      :weight_text, \
      :amount_spent, \
      :amount_to_spend, \
      :need_to_buy_more?, \
      :brand, \
      :quantity_wanted, \
      :price, \
      :created_at, \
      :updated_at, \
      :type, \
      :category, \
      to: :model

    def to_hash
      {
        id: id,
        type: type,
        category: category,
        brand: brand,
        name: name,
        description: description,
        size: size,
        quantity: quantity,
        color: color,
        model_number: model_number,
        shape: shape,
        length: length_text,
        weight: weight_text,
        quantity_wanted: quantity_wanted,
        amount_spent: to_currency(amount_spent),
        amount_to_spend: to_currency(amount_to_spend),
        need_to_buy_more: need_to_buy_more?,
        price: to_currency(price),
        currency: 'USD',
        created_at: json_time(created_at),
        updated_at: json_time(updated_at)
      }
    end
  end
end
