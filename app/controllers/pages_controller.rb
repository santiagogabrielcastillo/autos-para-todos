class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  
  def home
    @automobiles = Automobile.limit(3)
  end
end
