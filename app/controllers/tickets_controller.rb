class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
  end

  def order
    @ticket = Ticket.new(train_id: params[:train_id], first_station_id: params[:first_station_id], last_station_id: params[:last_station_id])
  end

  def create
    @user = User.new
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Спасибо за покупку!'
    else
      render 'order'
    end
  end


  private

    def ticket_params
      params.require(:ticket).permit(:passport, :user_name, :train_id, :first_station_id, :last_station_id)
    end

end
