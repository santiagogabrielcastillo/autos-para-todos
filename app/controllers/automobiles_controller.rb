class AutomobilesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:location_query].present? || params[:price_query].present? || params[:km_query].present? || params[:year_query].present? || params[:model_query].present? || params[:brand_query].present?
      @automobiles = Automobile.geocoded.search({
        location: params[:location_query],
        price: params[:price_query],
        km: params[:km_query],
        year: params[:year_query],
        model: params[:model_query],
        brand: params[:brand_query]
        })
    else
      @automobiles = Automobile.geocoded
    end

    @markers = @automobiles.map do |automobile|
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
