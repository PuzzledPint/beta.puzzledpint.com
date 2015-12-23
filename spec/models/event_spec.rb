require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do
    it { should validate_presence_of :theme }
    it { should validate_presence_of :event_at }
  end

  it { should have_many :event_locations }

  it 'destroys associated event_locations' do
    event = create(:event_location)
    expect { event.destroy }.to change(EventLocation, :count).by(-1)
  end

  it 'prevents past events from being destroyed' do
    event = create(:event, event_at: 1.day.ago)
    expect { event.destroy }.to raise_error 'Cannot destroy past events.'
  end
end
