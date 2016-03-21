require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'validations' do
    subject { build(:page) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:body) }

    it { should validate_uniqueness_of(:slug) }
  end
end
