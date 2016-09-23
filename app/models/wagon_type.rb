class WagonType < ApplicationRecord
  has_many :wagons

  validates :title, :wagon_type, presence: true
end
