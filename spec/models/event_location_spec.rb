require 'rails_helper'

RSpec.describe EventLocation, type: :model do
  it { should belong_to :city }
  it { should belong_to :event }
  it { should validate_presence_of :city }
  it { should validate_presence_of :event }

  describe '#complete?' do
    it 'is true if a bar name and address is present' do
      location = create(:event_location)
      expect(location.complete?).to be true
    end

    it 'is false if a note is present by address is not' do
      location = EventLocation.new(notes: 'notes')
      expect(location.complete?).to be false
    end

    it 'it returns false with no note or bar info' do
      location = EventLocation.new
      expect(location.complete?).to be false
    end
  end

  describe '#note_only?' do
    it 'is true if a note is present by address is not' do
      location = EventLocation.new(notes: 'notes')
      expect(location.notes_only?).to be true
    end

    it 'it returns false with no note or bar info' do
      location = EventLocation.new
      expect(location.notes_only?).to be false
    end
  end
end
