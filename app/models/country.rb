class Country
  def countries
    ISO3166::Country.countries.map { |c| { c.alpha2 => c.name } }
  end

  def subdivisions(country_code)
    country = ISO3166::Country.new(country_code)
    if country
      country.subdivisions.map { |k, v| { code: k, name: v["name"] } }
    else
      []
    end
  end
  alias :states :subdivisions
end
