require "rails_helper"

RSpec.describe RecipesController do
  let(:recipe) { FactoryBot.create(:recipe) }
  let(:recipe_second) { FactoryBot.create(:recipe) }

  describe "GET index" do
    it "see all recipes and render template" do
      get :index

      expect(assigns[:recipes]).to eq([recipe, recipe_second])
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "see one recipe" do
      get :show, params: { id: recipe.id }

      expect(assigns[:recipe]).to eq(recipe)
    end

    it "render template" do
      get :show, params: { id: recipe.id }

      expect(response).to render_template("show")
    end
  end
end
