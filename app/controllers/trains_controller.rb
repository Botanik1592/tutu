class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
    @kupe = []
    @plac = []
    @kupe_top_places = 0
    @kupe_lower_places = 0
    @plac_top_places = 0
    @plac_lower_places = 0

    @train.wagons.each do |wagon|
      if wagon.wagon_type.wagon_type == "Купейный"
        @kupe << wagon
        @kupe_top_places = @kupe_top_places + wagon.top_places
        @kupe_lower_places = @kupe_lower_places + wagon.lower_places
      else
        @plac << wagon
        @plac_top_places = @plac_top_places + wagon.top_places
        @plac_lower_places = @plac_lower_places + wagon.lower_places
      end
    end

  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to @train, notice: 'Поезд успешно создан.'
    else
      render :new
    end
  end

  def update

    if @train.update(train_params)
      redirect_to @train, notice: 'Поезд успешно обновлен'
    else
      render :edit
    end
  end

  def destroy
    @train.destroy
      redirect_to trains_url, notice: 'Поезд успешно удален.'
  end

  private

    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      params.require(:train).permit(:number, :current_station_id, :route_id)
    end
end
