if location.complete?
  json.city location.city.name
  json.bar location.bar_name
  json.bar_url location.bar_url
  json.start_time location.start_time.to_s(:time)
  json.stop_time (location.start_time + 3.hours).to_s(:time)
  json.address do
    json.street_1 location.addr_street_1
    json.street_2 location.addr_street_2
    json.city location.addr_city
    json.state display_state(location.addr_country, location.addr_state)
    json.postal_code location.addr_postal_code
    json.country location.addr_country
  end
  json.notes location.notes.html_safe
end

if location.notes_only?
  json.city location.city.name
  json.notes location.notes.html_safe
end
