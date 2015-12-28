class Event < ActiveRecord::Base
  include Authority::Abilities

  has_many :event_locations, dependent: :destroy

  validates :theme, presence: true
  validates :event_at, presence: true

  before_destroy :prevent_destroy

  def locations_tree
    locations = event_locations.includes(:city)
    locations.to_a.sort! { |x, y| x.city.name <=> y.city.name }

    # TODO clean this up some
    last_parent = ''
    locations.each_with_object([]) do |l, t|
      if l.city.parent?
        t << l
      else
        parent_name = l&.city&.parent&.name

        if parent_name == last_parent
          t.last[:locations] << l
        else
          last_parent = parent_name
          t << { city: parent_name, locations: [ l ] }
        end
      end
    end
  end

  private

  def prevent_destroy
    raise 'Cannot destroy past events.' if event_at < Time.zone.today
  end
end
