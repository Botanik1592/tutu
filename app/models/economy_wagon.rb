class EconomyWagon < Wagon

  validates :side_top_places, :side_lower_places, :top_places, :lower_places, presence: true

end
