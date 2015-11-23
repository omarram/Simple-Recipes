class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    #we're gonna use pry from gemfile now
    #pry will pause the server and we can check params in terminal
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)

    if @recipe.save
      flash[:success] = "Your recipe was successfully created"
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Your recipe was successfully updated"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description)
    end
end