require 'rails_helper'

RSpec.describe City, type: :model do
  context 'validations' do
    it { should validate_presence_of(:display_name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }

    it { should belong_to(:parent) }
  end
end
