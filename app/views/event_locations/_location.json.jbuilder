if location.complete?
  json.city location.city.name
  json.bar location.bar_name
  json.start_time location.start_time
  json.address do
    json.street_1 location.addr_street_1
    json.street_2 location.addr_street_2
    json.city location.addr_city
    json.state location.addr_state
    json.postal_code location.addr_postal_code
    json.country location.addr_country
  end
  json.notes location.notes
end
