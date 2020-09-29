class CategoriesController < ApplicationController

  def index
  end

  def show
  end

  private
  def category_params
      params.require(:category).permit(:name)
  end
end