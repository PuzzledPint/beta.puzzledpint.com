class EventLocation < ActiveRecord::Base
  belongs_to :city
  belongs_to :event

  validates :city, presence: true
  validates :event, presence: true
end
