require 'rails_helper'

RSpec.describe "game_control/puzzles/index", type: :view do
  before(:each) do
    assign(:game_control_puzzles, [
      GameControl::Puzzle.create!(
        :title => "Title"
      ),
      GameControl::Puzzle.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of game_control/puzzles" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
