module ApplicationHelper
  def display_state(country, state)
    return unless country.present? && state.present?
    if numeric?(state)
      look_up_state(country, state)
    else
      state
    end
  end

  private

  def look_up_state(country, state)
    subdivisions = Country.new.subdivisions(country)
    if subdivisions.present?
      subdivisions.find { |s| s[:code] == state }[:name]
    end
  end

  def numeric?(state)
    !Float(state).nil?
  rescue
    false
  end
end
