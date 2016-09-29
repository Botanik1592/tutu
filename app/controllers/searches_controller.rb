class SearchesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
  end

  def create
    if params[:first_station_id] == params[:last_station_id]
      @error = "Начальная и конечная станции не могут совпадать!"
      render :show
    else
      @trains = Search.search_trains(params[:first_station_id], params[:last_station_id])
      render :show
    end
  end

end
