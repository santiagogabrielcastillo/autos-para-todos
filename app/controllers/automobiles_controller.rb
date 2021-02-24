class AutomobilesController < ApplicationController
  def show
    @automobile = Automobile.find(params[:id])
  end
end
