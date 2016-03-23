class Page < ActiveRecord::Base
  include Authority::Abilities
  before_save :parameterize_slug

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :body, presence: true

  def to_param
    slug
  end

  def self.find(param)
    attr = param.to_i > 0 ? :id : :slug
    find_by(attr => param)
  end

  private

  def parameterize_slug
    self.slug = slug.parameterize
  end
end
