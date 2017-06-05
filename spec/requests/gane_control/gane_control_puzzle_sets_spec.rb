require 'rails_helper'

RSpec.describe "GameControl::PuzzleSets", type: :request do
  describe "GET /game_control_puzzle_sets" do
    it "works! (now write some real specs)" do
      get game_control_puzzle_sets_path
      expect(response).to have_http_status(200)
    end
  end
end
