class Puzzle < ActiveRecord::Base
  include Authority::Abilities
  belongs_to :puzzle_set
  has_many :hints
end
