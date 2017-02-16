class DosesController < ApplicationController

  def new
    # byebug
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @ingredient = Ingredient.find(params[:ingredient])
    # @dose.ingredient = @ingredient
    @ingredients = Ingredient.all
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new, {dose: @dose, cocktail: @cocktail}
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
