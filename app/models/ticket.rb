class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  validates :number, :user_name, :passport, presence: true

  before_validation :set_number, on: :create
  before_validation :set_user, on: :create

  private

  def set_number
    number = Ticket.maximum(:number)
    self.number = number.nil? ? 1 : number + 1
  end

  def set_user
    user = User.new
    user.save
    self.user = user
  end
end
