class EventAuthorizer < ApplicationAuthorizer
  def self.readable_by?(user)
    user.has_any_role? :admin, :location_gc
  end
end
