class DosesController < ApplicationController
   def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @doses = @cocktail.doses
      render "cocktails/show"
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

    def new
      @dose = Dose.new
    end

    def destroy
      @dose.destroy
      redirect_to cocktails_path
    end
end
