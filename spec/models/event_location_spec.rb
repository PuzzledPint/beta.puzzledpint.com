require 'rails_helper'

RSpec.describe EventLocation, type: :model do
  it { should belong_to :city }
  it { should belong_to :event }
end
