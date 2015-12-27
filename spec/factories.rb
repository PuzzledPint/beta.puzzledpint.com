FactoryGirl.define do
  factory :admin, class: Admin do
    sequence :email do |n|
      "admin#{n}@admin.com"
    end
    password 'password'
    password_confirmation 'password'
    full_name 'Frank Smith'

    before(:create) do |admin, _|
      admin.roles << create(:role)
    end

    factory :admin_user do
      before(:create) do |admin, _|
        admin.roles = [create(:admin_role)]
      end
    end
  end

  factory :admin_role, class: Role do
    name 'admin'
  end

  factory :city do
    name 'Shaolin'
    state 'New York'
    country 'United States'
  end

  factory :event do
    event_at Time.zone.today
    theme "MyString"
  end

  factory :event_location do
    bar_name 'Foo'
    event
    city
    notes 'Some random notes'
    addr_street_1 '123 Some St'
    addr_street_2 'Apt 105'
    addr_city 'Portlad'
    addr_state 'OR'
    addr_postal_code '97232'
    addr_country 'US'
  end

  factory :role do
    sequence :name do |n|
      "role#{n}"
    end
  end
end
