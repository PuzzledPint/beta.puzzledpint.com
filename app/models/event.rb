class Event < ActiveRecord::Base
  include Authority::Abilities

  has_many :event_locations, dependent: :destroy

  validates :theme, presence: true
  validates :event_at, presence: true

  before_destroy :prevent_destroy

  private

  def prevent_destroy
    raise 'Cannot destroy past events.' if event_at < Time.zone.today
  end
end
