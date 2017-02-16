class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.create(dose_params)
    @dose = Dose.new(dose_params)
    if @dose.save
      redirecto_to cocktail_path(@cocktail)
    else
      render 'cocktails'
    end
  end

  def destroy
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    param.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
