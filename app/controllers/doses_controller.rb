class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end
  
  def show
    @dose = Dose.find(params[:id])
  end
  
  def destroy
    @dose = Dose.destroy(params[:id])
    #@cocktail = Cocktail.find(params[:cocktail_id])
    redirect_to cocktail_path(@dose.cocktail)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

