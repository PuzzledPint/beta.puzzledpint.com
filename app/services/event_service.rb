class EventService
  def add_event_locations(event, city_ids)
    city_ids.each do |city_id|
      city = City.find city_id
      event.event_locations.create(city_id: city.id,
                                   addr_city: city.name,
                                   addr_state: city.state,
                                   addr_country: city.country
                                  )
    end
  end
end
