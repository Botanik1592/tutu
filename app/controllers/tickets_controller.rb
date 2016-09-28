class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:destroy, :show]

  def show
  end

  def order
    @ticket = Ticket.new(train_id: params[:train_id], first_station_id: params[:first_station_id], last_station_id: params[:last_station_id])
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Спасибо за покупку!'
    else
      render 'order'
    end
  end

  def destroy
    @ticket.destroy
      redirect_to tickets_url, notice: 'Поезд успешно удален.'
  end


  private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:passport, :user_name, :train_id, :first_station_id, :last_station_id)
    end

end
