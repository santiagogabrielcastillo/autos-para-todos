class AutomobilesController < ApplicationController
  def index
    @automobiles = Automobile.all
  end
end
