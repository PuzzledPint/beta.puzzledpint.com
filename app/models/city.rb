class City < ActiveRecord::Base
  belongs_to :parent, class_name: "City"
  has_many :children, class_name: "City", foreign_key: :parent_id
  has_and_belongs_to_many :admins

  validates :name, :country, presence: true

  include Authority::Abilities

  def self.parent_cities
    where(parent: nil)
  end

  def child?
    parent.present?
  end

  def parent?
    not child?
  end

  def display_name
    return "#{parent.name} - #{name}" if parent
    name
  end
end
