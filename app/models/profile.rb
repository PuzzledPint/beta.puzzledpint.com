class Profile
  def initialize(admin, scopes)
    @admin = admin
    @scopes = scopes
  end

  def as_json(*)
    profile = {}
    profile["email"] = admin.email if scopes.include? "login"
    profile["name"] = admin.full_name if scopes.include? "login"
    if scopes.include? "cities"
      profile["cities"] = admin.cities.map { |c| serialized_city(c) }
    end
    profile
  end

  private

  attr_reader :admin, :scopes

  def serialized_city(city)
    hsh = city.as_json(only: %i[id name country])
    hsh["parent"] = serialized_city(city.parent) if city.child?
    hsh
  end
end
