class EventLocationAuthorizer < ApplicationAuthorizer
  def updatable_by?(user)
    user.has_role?(:admin) || (user.has_role?(:location_gc) && has_city_access?(user))
  end

  private

  def has_city_access?(user)
    user.cities.include?(resource.city) || user.cities.include?(resource.city.parent)
  end
end
