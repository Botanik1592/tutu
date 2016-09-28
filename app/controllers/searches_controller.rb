class SearchesController < ApplicationController

  def show

  end

  def create
    if params[:first_station_id] == params[:last_station_id]
      @error = "Начальная и конечная станции не могут совпадать!"
      render :show
    else
      @user = User.create
      @trains = Search.search_trains(params[:first_station_id], params[:last_station_id])
      render :show
    end
  end

end
