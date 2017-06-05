require 'rails_helper'

RSpec.describe "game_control/puzzle_sets/edit", type: :view do
  before(:each) do
    @game_control_puzzle_set = assign(:game_control_puzzle_set, GameControl::PuzzleSet.create!(
      :Puzzles => nil,
      :theme => "MyString"
    ))
  end

  it "renders the edit game_control_puzzle_set form" do
    render

    assert_select "form[action=?][method=?]", game_control_puzzle_set_path(@game_control_puzzle_set), "post" do

      assert_select "input#game_control_puzzle_set_Puzzles_id[name=?]", "game_control_puzzle_set[Puzzles_id]"

      assert_select "input#game_control_puzzle_set_theme[name=?]", "game_control_puzzle_set[theme]"
    end
  end
end
