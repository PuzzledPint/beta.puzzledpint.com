require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'validations' do
    subject { build(:page) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:body) }

    it { should validate_uniqueness_of(:slug) }
  end

  context 'slug' do
    it 'parameterizes slugs' do
      page = Page.create!(title: 'title', slug: 'some ^^ slug&', body: 'body')
      expect(page.slug).to eq('some-slug')
    end
  end
end
