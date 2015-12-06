class City < ActiveRecord::Base
  belongs_to :parent, class_name: "City"
  has_many :children, class_name: "City", foreign_key: :parent_id

  validates :display_name, :country, presence: true
  validate :validate_name_and_parent

  include Authority::Abilities

  def self.parent_cities
    where(parent: nil)
  end

  private

  def validate_name_and_parent
    unless name.present? ^ parent.present?
      errors[:base] << 'either name or parent are requited, but not both'
    end
  end
end
