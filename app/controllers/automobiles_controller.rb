class AutomobilesController < ApplicationController
  def index
    @automobiles = Automobile.all
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
