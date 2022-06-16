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

  describe "POST create" do
    it "create a new recipe" do
      recipe = FactoryBot.build(:recipe)

      expect do
        post :create, params: { :recipe => FactoryBot.attributes_for(:recipe) }
      end.to change{ Recipe.count }.by(1)
    end

    it "redirects to recipes_path" do
      recipe = FactoryBot.build(:recipe)

      expect do
        post :create, params: { :recipe => FactoryBot.attributes_for(:recipe) }
      end

      expect(response).to be_successful
    end
  end
end
