require 'rails_helper'

RSpec.describe "game_control/puzzles/show", type: :view do
  before(:each) do
    @puzzle = assign(:puzzle, GameControl::Puzzle.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
