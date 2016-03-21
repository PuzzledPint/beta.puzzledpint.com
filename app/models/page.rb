class Page < ActiveRecord::Base
  include Authority::Abilities

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :body, presence: true
end
