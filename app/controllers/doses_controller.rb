class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktails_path
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  def dose_params
    params.require(:dose).permit(:cocktail, :ingredient, :description)
  end
end
