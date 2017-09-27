class TackleType < ApplicationRecord
  belongs_to :tackle_category
  has_many :tackles

  validates :name, uniqueness: true, presence: true
end
