class Puzzle < ActiveRecord::Base
  belongs_to :puzzle_set
  has_many :hints
end
