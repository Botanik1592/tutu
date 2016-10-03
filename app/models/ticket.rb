class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  validates :user_name, :passport, presence: true
  validates :passport, format: { with: /\A[[:digit:]]{4}[\s]+[[:digit:]]{6}\z/ }
  validates :user_name, length: { minimum: 3, maximum: 50 }

  after_create :send_notification
  before_destroy :save_ticket_params
  after_destroy :send_destroy_notification

  def route_name
    "#{first_station.title} - #{last_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def save_ticket_params
    @ticket_route = self.route_name
  end

  def send_destroy_notification
    TicketsMailer.delete_ticket(self.user, @ticket_route).deliver_now
  end
end
