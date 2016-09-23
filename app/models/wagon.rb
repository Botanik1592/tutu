class Wagon < ApplicationRecord
  PLACES = { top_places: 'Верхние места', lower_places: 'Нижние места', side_top_places: 'Боковые верхние места', side_lower_places: 'Боковые нижние места', seats: 'Сидячие места'}

  belongs_to :train

  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  scope :ordered, -> { order(:number) }

private
  def set_number
    number = train.wagons.maximum(:number)
    self.number = number.nil? ? 1 : number + 1
  end

end
