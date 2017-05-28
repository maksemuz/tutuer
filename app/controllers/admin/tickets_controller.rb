class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to [:admin, @ticket], notice: 'Билет приобретен.'
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Билет изменен.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_url, notice: 'Билет аннулирован.'
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:source_id,
                                   :destination_id,
                                   :train_id,
                                   :passenger_fio,
                                   :passport_data,
                                   :user_id)
  end
end
