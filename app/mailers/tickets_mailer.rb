class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: @user.email, subject: "Новый заказ в сервисе билетов Tu-Tu")
  end
end
