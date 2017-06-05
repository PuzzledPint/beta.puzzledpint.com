require 'rails_helper'

RSpec.describe "GameControl::Puzzles", type: :request do
  describe "GET /game_control_puzzles" do
    it "works! (now write some real specs)" do
      get game_control_puzzles_path
      expect(response).to have_http_status(200)
    end
  end
end
