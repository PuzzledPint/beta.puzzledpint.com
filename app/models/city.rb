class City < ActiveRecord::Base
  belongs_to :parent, class_name: "City"
  has_many :children, class_name: "City", foreign_key: :parent_id

  validates :display_name, :city, :country, presence: true

  include Authority::Abilities

  def self.parent_cities
    where(parent: nil)
  end
end
