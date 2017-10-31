class Tackle < ApplicationRecord

  belongs_to :user
  belongs_to :tackle_type

  LENGTH_UNITS = ['inch', 'centimeter', 'millimeter', 'meter', 'foot', 'yard']
  WEIGHT_UNITS = ['kilogram', 'gram', 'centigram', 'milligram', 'stone', 'pound', 'ounce']

  validates :user_id, presence: true
  validates :tackle_type_id, presence: true
  validates :name, presence: true
  validates :size, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :length, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :length_unit, inclusion: { in: LENGTH_UNITS, message: "%{value} is not valid, must be: #{LENGTH_UNITS.join(', ')}" }, if: :length_entered?
  validates :weight, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :weight_unit, inclusion: { in: WEIGHT_UNITS, message: "%{value} is not valid, must be: #{WEIGHT_UNITS.join(', ')}" }, if: :weight_entered?
  validates :quantity_wanted, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  def weight_unit=(value)
    value = nil unless weight.present? && weight > 0
    super(value)
  end

  def length_unit=(value)
    value = nil unless length.present? && length > 0
    super(value)
  end

  def weight=(value)
    self.weight_unit = nil if value <= 0
    super(value)
  end
  def length=(value)
    self.length_unit = nil if value <= 0
    super(value)
  end

  def quantity_needed_to_buy
    quantity_wanted - quantity if need_to_buy_more?
  end

  def amount_spent
    return if price.blank?
    return if quantity.blank?
    price * quantity
  end

  def amount_to_spend
    return if price.blank?
    return if quantity_wanted.blank?
    price * quantity_wanted
  end

  def need_to_buy_more?
    return if quantity_wanted.blank?
    return if quantity.blank?
    quantity_wanted > quantity
  end

  def length_text
    return if length.blank?
    "#{length} #{length_unit}"
  end

  def weight_text
    return if weight.blank?
    "#{weight} #{weight_unit}"
  end

  def type
    tackle_type.name
  end

  def category
    tackle_type.tackle_category.name
  end

  def to_s
    name.titleize
  end

  private

    def weight_entered?
      return unless weight.present?
      weight > 0
    end

    def length_entered?
      return unless length.present?
      length > 0
    end
end
