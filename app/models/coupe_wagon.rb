class CoupeWagon < Wagon

  validates :top_places, :lower_places, presence: true

end
