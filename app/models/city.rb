class City < ActiveRecord::Base
  belongs_to :parent, class_name: City
  validates :display_name, :city, :country, presence: true

  include Authority::Abilities
end
