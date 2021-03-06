class Admin::WagonsController < Admin::BaseController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create, :edit]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to admin_train_path(@train), notice: t('.notice')
    else
      render :new
    end
  end

  def update

    if @wagon.update(wagon_params)
      redirect_to admin_trains_url, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
      redirect_to admin_trains_url, notice: t('.notice')
  end

  private
    def set_wagon
      @wagon = Wagon.find(params[:id])
    end

    def wagon_params
      params.require(:wagon).permit(:number, :type, :top_places, :lower_places, :side_top_places, :side_lower_places, :seats, :train_id)
    end

    def set_train
      @train = Train.find(params[:train_id])
    end
end
