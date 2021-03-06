class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:destroy, :show, :edit, :update]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket), notice: 'Билет успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
      redirect_to admin_tickets_url, notice: 'Билет успешно удален.'
  end

  private

    def set_ticket
      @ticket = current_user.tickets.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:passport, :user_name, :train_id, :first_station_id, :last_station_id)
    end
end

