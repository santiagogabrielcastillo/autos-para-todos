class AutomobilesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @automobiles = Automobile.all

    @markers = @automobiles.geocoded.map do |automobile|
      {
        lat: automobile.latitude,
        lng: automobile.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { automobile: automobile })
      }
    end
  end

  def show
    @automobile = Automobile.find(params[:id])
  end

  def new
    @automobile = Automobile.new
  end

  def create
    @automobile = Automobile.new(automobile_params)
    @automobile.user = current_user
    if @automobile.save
      redirect_to automobile_path(@automobile)
    else
      render :new
    end
  end

  def edit
    @automobile = Automobile.find(params[:id])
  end

  def update
    @automobile = Automobile.find(params[:id])
    @automobile.update(automobile_params)
    redirect_to automobile_path(@automobile)
  end

  private

  def automobile_params
    params.require(:automobile).permit(:brand, :model, :year, :km, :category, :price, :photo)
  end
end
