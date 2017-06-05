require 'rails_helper'

RSpec.describe "game_control/puzzle_sets/new", type: :view do
  before(:each) do
    assign(:game_control_puzzle_set, GameControl::PuzzleSet.new(
      :Puzzles => nil,
      :theme => "MyString"
    ))
  end

  it "renders new game_control_puzzle_set form" do
    render

    assert_select "form[action=?][method=?]", game_control_puzzle_sets_path, "post" do

      assert_select "input#game_control_puzzle_set_Puzzles_id[name=?]", "game_control_puzzle_set[Puzzles_id]"

      assert_select "input#game_control_puzzle_set_theme[name=?]", "game_control_puzzle_set[theme]"
    end
  end
end
