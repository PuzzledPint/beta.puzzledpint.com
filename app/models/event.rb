class Event < ApplicationRecord
  include Authority::Abilities

  has_many :event_locations, dependent: :destroy

  validates :theme, presence: true
  validates :event_at, presence: true

  before_destroy :prevent_destroy

  def self.upcoming
    where('event_at >= ?', Time.zone.now).order(:event_at).first
  end

  def locations_tree
    locations = event_locations.includes(:city)
    locations = locations.to_a.sort do |x, y|
      x.city.display_name <=> y.city.display_name
    end

    build_tree locations
  end

  def past?
    event_at < Time.zone.today
  end

  private

  # TODO clean this up some
  def build_tree(locations, last_parent = '')
    locations.each_with_object([]) do |l, t|
      if l.city.parent?
        t << l
      else
        parent_name = l&.city&.parent&.name
        if parent_name == last_parent
          t.last[:locations] << l
        else
          last_parent = parent_name
          t << { city: parent_name, locations: [l] }
        end
      end
    end
  end

  def prevent_destroy
    raise 'Cannot destroy past events.' if past?
  end
end
