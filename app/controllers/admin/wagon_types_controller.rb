class Admin::WagonTypesController < Admin::BaseController
  before_action :set_wagon_type, only: [:show, :edit, :update, :destroy]

  def index
    @wagon_types = WagonType.all
  end

  def show
  end

  def new
    @wagon_type = WagonType.new
  end

  def edit
  end

  def create
    @wagon_type = WagonType.new(wagon_type_params)

    if @wagon_type.save
      redirect_to admin_wagon_types_url, notice: 'Тип успешно создан.'
    else
      render :new
    end
  end

  def update
  end


  def destroy
    @wagon_type.destroy
      redirect_to admin_wagon_types_url, notice: 'Тип успешно удален'
  end

  private
    def set_wagon_type
      @wagon_type = WagonType.find(params[:id])
    end

    def wagon_type_params
      params.require(:wagon_type).permit(:title, :wagon_type)
    end
end
