class AutomobilesController < ApplicationController
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

  private

  def automobile_params
    params.require(:automobile).permit(:brand, :model, :year, :km, :category, :price, :photo)
  end
end
