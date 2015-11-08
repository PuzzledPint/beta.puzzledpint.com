require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject { create(:admin) }

  context 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :full_name }
  end

  describe '#display_name' do
    context 'full_name is not present' do
      before { subject.update_attribute(:full_name, nil) }

      it { expect(subject.display_name).to eq(subject.email) }
    end

    context 'full_name is present' do
      it { expect(subject.display_name).to eq(subject.full_name) }
    end
  end

  describe '#avatar' do
    it { expect(subject.avatar).to eq("https://robohash.org/#{subject.email}.png?set=set3&bgset=bg2") }
  end
end
