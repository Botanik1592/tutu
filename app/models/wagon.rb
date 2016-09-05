class Wagon < ApplicationRecord
  belongs_to :train
  belongs_to :wagon_type

  validates :number, :top_places, :lower_places, presence: true
end
