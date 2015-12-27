json.locations @locations do |location|
  json.location_name location.city.full_name
  json.bar_name location.bar_name
  json.start_time location.start_time
  json.address do
    json.street1 location.addr_street_1
    json.street2 location.addr_street_2 if location.addr_street_2.present?
    json.city location.addr_city
    json.state location.addr_state
    json.country location.addr_country
  end
  json.notes location.notes
end
