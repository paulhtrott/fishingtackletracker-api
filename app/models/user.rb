class User < ApplicationRecord
  has_many :tackles

  validates :email, uniqueness: true, presence: true, format: { with: /.+@.+\..+/ }
end
