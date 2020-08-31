require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject { Profile.new(admin, scopes) }

  describe '#as_json' do
    before do
      @parent = create(:city, name: "Parentburg", country: "US")
      @child = create(:city, name: "Childville", country: "US", parent: @parent)
    end

    let(:admin) do
      build(:admin, email: 'admin@example.test', full_name: 'Test Admin', cities: [@child])
    end

    context 'with no scopes' do
      let(:scopes) { [] }

      it 'returns no data' do
        expected = {}
        expect(subject.as_json).to eq(expected)
      end
    end

    context 'with login scope' do
      let(:scopes) { ['login'] }

      it 'returns user data only' do
        expected = {
          'email' => 'admin@example.test',
          'name' => 'Test Admin'
        }

        expect(subject.as_json).to eq(expected)
      end
    end

    context 'with all scopes' do
      let(:scopes) { ['login', 'cities'] }

      it 'returns user and city data' do
        expected = {
          'email' => 'admin@example.test',
          'name' => 'Test Admin',
          'cities' => [
            {
              'id' => @child.id,
              'name' => @child.name,
              'country' => @child.country,
              'parent' => {
                'id' => @parent.id,
                'name' => @parent.name,
                'country' => @parent.country
              }
            }
          ]
        }

        expect(subject.as_json).to eq(expected)
      end
    end
  end
end
