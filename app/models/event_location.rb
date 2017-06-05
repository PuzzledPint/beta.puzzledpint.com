class EventLocation < ActiveRecord::Base
  include Authority::Abilities

  belongs_to :city
  belongs_to :event

  validates :city, presence: true
  validates :event, presence: true

  validates :bar_url, url: true

  def complete?
    bar_name.present? && addr_street_1.present? && addr_city.present?
  end

  def notes_only?
    notes.present? && !(bar_name.present? && addr_street_1.present?)
  end
end
