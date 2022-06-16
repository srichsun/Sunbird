class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show ]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
    search_term = params[:search_term]

    if search_term.nil?
      redirect_to recipes_path
    else
      search_term = search_term.downcase
      @recipes = Recipe.where("lower(title) LIKE ? OR lower(content) LIKE ?", "%#{search_term}%", "%#{search_term}%")
      render :index
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :content)
    end
end
