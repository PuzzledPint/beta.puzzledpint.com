class EventLocation < ActiveRecord::Base
  belongs_to :city
  belongs_to :event

  validates :city, presence: true
  validates :event, presence: true

  def complete?
    bar_name.present? && addr_street_1.present? && addr_city.present?
  end
end
