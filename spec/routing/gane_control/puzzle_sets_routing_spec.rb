require "rails_helper"

RSpec.describe GameControl::PuzzleSetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/game_control/puzzle_sets").to route_to("game_control/puzzle_sets#index")
    end

    it "routes to #new" do
      expect(:get => "/game_control/puzzle_sets/new").to route_to("game_control/puzzle_sets#new")
    end

    it "routes to #show" do
      expect(:get => "/game_control/puzzle_sets/1").to route_to("game_control/puzzle_sets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/game_control/puzzle_sets/1/edit").to route_to("game_control/puzzle_sets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/game_control/puzzle_sets").to route_to("game_control/puzzle_sets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/game_control/puzzle_sets/1").to route_to("game_control/puzzle_sets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/game_control/puzzle_sets/1").to route_to("game_control/puzzle_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/game_control/puzzle_sets/1").to route_to("game_control/puzzle_sets#destroy", :id => "1")
    end

  end
end
