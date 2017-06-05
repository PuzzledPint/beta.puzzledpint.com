require 'rails_helper'

RSpec.describe "game_control/puzzles/new", type: :view do
  before(:each) do
    assign(:puzzle, GameControl::Puzzle.new(
      :title => "MyString"
    ))
  end

  it "renders new game_control_puzzle form" do
    render

    assert_select "form[action=?][method=?]", game_control_puzzles_path, "post" do

      assert_select "input#game_control_puzzle_title[name=?]", "game_control_puzzle[title]"
    end
  end
end
