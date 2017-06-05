require 'rails_helper'

RSpec.describe "game_control/puzzle_sets/index", type: :view do
  before(:each) do
    assign(:puzzle_sets, [
      GameControl::PuzzleSet.create!(
        :Puzzles => nil,
        :theme => "Theme"
      ),
      GameControl::PuzzleSet.create!(
        :Puzzles => nil,
        :theme => "Theme"
      )
    ])
  end

  it "renders a list of game_control/puzzle_sets" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Theme".to_s, :count => 2
  end
end
