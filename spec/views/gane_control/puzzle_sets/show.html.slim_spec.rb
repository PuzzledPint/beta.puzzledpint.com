require 'rails_helper'

RSpec.describe "game_control/puzzle_sets/show", type: :view do
  before(:each) do
    @puzzle_set = assign(:puzzle_set, GameControl::PuzzleSet.create!(
      :Puzzles => nil,
      :theme => "Theme"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Theme/)
  end
end
