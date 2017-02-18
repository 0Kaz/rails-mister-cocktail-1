class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order(:name).where("name ILIKE ?", "%#{params[term]}%")
    render json: @ingredients.map(&:name) }
  end
end
