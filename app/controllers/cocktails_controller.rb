class CocktailsController < ApplicationController
  def index
    # A user can see the list of cocktails
    # GET "cocktails"
    @cocktails = Cocktail.all
  end

  def show
    # A user can see the details of a given cocktail,
    # with the dose needed for each ingredient
    # GET "cocktails/42"
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    @ingredients = @cocktail.ingredients
  end

  def new
    # A user can create a new cocktail
    # GET "cocktails/new"
    @cocktail = Cocktail.new
  end

  def create
    # POST "cocktails"
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
