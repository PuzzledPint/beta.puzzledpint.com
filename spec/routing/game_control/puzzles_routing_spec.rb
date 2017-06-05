require "rails_helper"

RSpec.describe GameControl::PuzzlesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/game_control/puzzles").to route_to("game_control/puzzles#index")
    end

    it "routes to #new" do
      expect(:get => "/game_control/puzzles/new").to route_to("game_control/puzzles#new")
    end

    it "routes to #show" do
      expect(:get => "/game_control/puzzles/1").to route_to("game_control/puzzles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/game_control/puzzles/1/edit").to route_to("game_control/puzzles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/game_control/puzzles").to route_to("game_control/puzzles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/game_control/puzzles/1").to route_to("game_control/puzzles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/game_control/puzzles/1").to route_to("game_control/puzzles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/game_control/puzzles/1").to route_to("game_control/puzzles#destroy", :id => "1")
    end

  end
end
