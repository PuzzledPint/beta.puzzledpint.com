require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'validations' do
    subject { build(:page) }

    it { should have_many(:children).class_name('Page') }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:content) }

    it 'validates_uniqueness of full_path' do
      parent = create(:page, slug: :parent)
      create(:page, slug: :child, parent: parent)

      page = build(:page, slug: :child, parent: parent)
      expect(page).to be_invalid
    end

    it { should have_db_index(:parent_id) }
    it { should have_db_index(:full_path).unique }
    it { should have_db_index(:slug) }
  end

  describe 'paremeterize slug' do
    subject(:page) { create(:page, slug: 'some ^^ slug&') }
    it { expect(page.slug).to eq('some-slug') }
  end

  describe 'generate path' do
    let(:parent) { create(:page, slug: :parent) }
    let(:child) { create(:page, slug: :child, parent: parent) }
    let(:grand_child) { create(:page, slug: :grandchild, parent: child) }

    it { expect(parent.full_path).to eq('parent') }
    it { expect(child.full_path).to eq('parent/child') }
    it { expect(grand_child.full_path).to eq('parent/child/grandchild') }
  end
end
