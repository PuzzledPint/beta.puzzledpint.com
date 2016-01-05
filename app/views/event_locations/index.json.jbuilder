json.locations @locations do |l|
  if l.respond_to?(:bar_name)
    json.partial! 'location', location: l
  else
    if l[:locations].select(&:complete?).present?
      json.city l[:city]
      json.locations l[:locations], partial: 'location', as: :location
    end
  end
end
