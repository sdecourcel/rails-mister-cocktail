class DosesController < ApplicationController

  def new
    # byebug
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    #@dose = Dose.new(dose_params)
    #@dose.cocktail = @cocktail
    #@dose = @cocktail.doses.build(dose_params)
    @dose = @cocktail.doses.new(dose_params)
    # @ingredient = Ingredient.find(params[:ingredient])
    # @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show' #:new #, {dose: @dose, cocktail: @cocktail}
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # redirect_to cocktail_path(params[:cocktail_id])
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
