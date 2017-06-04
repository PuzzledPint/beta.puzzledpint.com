class PuzzleSet < ActiveRecord::Base
  has_many :puzzles
  has_one :event
end
