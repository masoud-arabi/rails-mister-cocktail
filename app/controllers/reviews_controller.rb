class ReviewsController < ApplicationController
    before_action :cocktail_params, only:[:new, :create]
    def new
        @review = Review.new
    end

    def create   
        @review = Review.new(set_review)
        @review.cocktail = @cocktail
        if @review.save
            redirect_to cocktail_path(@cocktail)
        else
            render :new
        end
    end

    private

    def cocktail_params
        @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def set_review
        params.require(:review).permit(:content, :rating)
    end
end
