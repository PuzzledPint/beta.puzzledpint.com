require 'rails_helper'
require 'digest/md5'

RSpec.describe Admin, type: :model do
  subject { create(:admin) }

  it { should have_and_belong_to_many(:cities) }

  context 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :full_name }
    it { should validate_presence_of :roles }
  end

  describe '#avatar' do
    it { expect(subject.avatar).to eq("https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(subject.email.strip.downcase)}?s=180") }
  end
end
