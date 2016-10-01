class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  validates :user_name, :passport, presence: true

  after_create :send_notification

  def route_name
    "#{first_station.title} - #{last_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
end
