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
    if current_user.first_name.nil? || current_user.first_name.empty?
      redirect_to root_path, notice: "Please enter your name before adding a cocktail"
    else
      @cocktail = current_user.cocktails.new
    end
  end

  def edit
    if current_user != @cocktail.user
      redirect_to cocktail_path(@cocktail)
    end
    @dose = Dose.new
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
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail), notice: "Cocktail Updated"
    else
      render :edit
    end
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
