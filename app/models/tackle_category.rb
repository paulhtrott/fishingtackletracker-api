class TackleCategory < ApplicationRecord
  has_many :tackle_types

  validates :name, uniqueness: true, presence: true
end
