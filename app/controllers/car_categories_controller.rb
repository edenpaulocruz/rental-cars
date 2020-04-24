class CarCategoriesController < ApplicationController
  def index
    @car_categories = CarCategory.all
  end

  def show
    id = params[:id]
    @car_category = CarCategory.find(id)
  end
end