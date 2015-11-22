require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject { create(:admin) }

  context 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :full_name }
    it { should validate_presence_of :roles }
  end

  describe '#avatar' do
    it { expect(subject.avatar).to eq("https://robohash.org/#{subject.email}.png?set=set3&bgset=bg2") }
  end
end
