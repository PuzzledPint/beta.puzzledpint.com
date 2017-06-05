class PuzzleSet < ActiveRecord::Base
  include Authority::Abilities
  has_many :puzzles
  has_one :event
end
