class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @ticket = ticket
    @user = user
    mail(to: @user.email, subject: "Новый заказ в сервисе билетов Tu-Tu")
  end

  def delete_ticket(user, route)
    @route = route
    @user = user
    mail(to: @user.email, subject: "Заказ отменен.")
  end
end
