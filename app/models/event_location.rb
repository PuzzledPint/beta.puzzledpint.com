class EventLocation < ActiveRecord::Base
  include Authority::Abilities

  belongs_to :city
  belongs_to :event

  validates :city, presence: true
  validates :event, presence: true

  validates :bar_url, format: { with: /\A(https?\:\/\/)?/, message: "please enter a valid URL starting with http" }

  def parent_location
    if city.child? # if this _is a_ child and _has a_ parent
      event.event_locations.find_by(city: city.parent)
    else
      return nil
    end
  end

  def complete?
    pl = parent_location
    (nil != pl && pl.complete?) || (bar_name.present? && addr_street_1.present? && addr_city.present?)
  end

  def notes_only?
    notes.present? && !(bar_name.present? && addr_street_1.present?)
  end
end
