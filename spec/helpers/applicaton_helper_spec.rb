require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#display_state' do
    context 'state is string' do
      it 'returns the string' do
        expect(display_state('US', 'OR')).to eq('OR')
      end
    end

    context 'state is a code' do
      it 'returns full name' do
        expect(display_state('AT', '9')).to eq('Wien')
      end
    end

    context 'missing values' do
      it {  expect(display_state(nil, '9')).to be_nil }
      it {  expect(display_state('US', nil)).to be_nil }
      it {  expect(display_state(nil, nil)).to be_nil }
      it {  expect(display_state('', '')).to be_nil }
    end
  end
end
