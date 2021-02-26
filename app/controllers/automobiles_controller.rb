class AutomobilesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:location_query].present? || params[:price_query].present? || params[:km_query].present? || params[:model_brand_query].present?
      @automobiles = Automobile.geocoded.search({
        location: params[:location_query],
        price: params[:price_query],
        km: params[:km_query],
        model_brand: params[:model_brand_query],
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
    @booking = Booking.new
    @automobile = Automobile.find(params[:id])
  end

  def new
    @automobile = Automobile.new
  end

  def create
    @automobile = Automobile.new(automobile_params)
    @automobile.user = current_user
    if @automobile.save
      redirect_to owner_path
    else
      render :new
    end
  end

  def edit
    @automobile = Automobile.find(params[:id])
  end

  def update
    @automobile = Automobile.find(params[:id])
    if @automobile.update(automobile_params)
      redirect_to automobile_path(@automobile)
    else
      render :edit
    end
  end

  def owner
    @automobiles = Automobile.where(user_id: current_user.id)
  end

  private

  def automobile_params
    params.require(:automobile).permit(:brand, :model, :year, :km, :category, :price, :photo)
  end
end
