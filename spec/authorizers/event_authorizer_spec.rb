require 'rails_helper'

RSpec.describe EventAuthorizer do
  describe 'class' do
    describe 'readable' do
      it { expect(EventAuthorizer).to be_readable_by(create(:admin_user)) }
      it { expect(EventAuthorizer).to be_readable_by(create(:location_gc_user)) }
    end

    describe 'manageable' do
      it { expect(EventAuthorizer).to be_manageable_by(create(:admin_user)) }
      it { expect(EventAuthorizer).not_to be_manageable_by(create(:location_gc_user)) }
    end
  end
end
