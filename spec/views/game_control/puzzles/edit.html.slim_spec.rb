require 'rails_helper'

RSpec.describe "game_control/puzzles/edit", type: :view do
  before(:each) do
    @puzzle = assign(:puzzle, GameControl::Puzzle.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit game_control_puzzle form" do
    render

    assert_select "form[action=?][method=?]", game_control_puzzle_path(@puzzle), "post" do

      assert_select "input#game_control_puzzle_title[name=?]", "game_control_puzzle[title]"
    end
  end
end
