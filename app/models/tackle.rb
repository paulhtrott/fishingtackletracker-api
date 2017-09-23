class Tackle < ApplicationRecord
  belongs_to :user
  belongs_to :tackle_type
end
