class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = current_user.cocktails.new
  end

  def edit
  end

  def create
    @cocktail = current_user.cocktails.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :about, :instructions, :photo, :photo_cache)
  end
end
