class Page < ActiveRecord::Base
  include Authority::Abilities

  has_many :children, class_name: 'Page', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Page'

  before_validation :parameterize_slug, :update_path

  validates :title, presence: true
  validates :slug, presence: true
  validates :full_path, presence: true, uniqueness: true
  validates :content, presence: true

  def self.find(param)
    attr = param.to_i > 0 ? :id : :slug
    find_by(attr => param)
  end

  def self.active
    where(active: true)
  end

  protected

  def generate_path
    return slug unless parent.present?
    "#{parent.generate_path}/#{slug}"
  end

  private

  def parameterize_slug
    self.slug = slug&.parameterize
  end

  def update_path
    self.full_path = generate_path
  end
end
