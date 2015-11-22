FactoryGirl.define do
  factory :admin_role, class: Role do
    name 'admin'
  end

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

  factory :city do
    name "Shaolin"
    city "Staten Island"
    state "New York"
    country "United States"
  end

  factory :role do
    sequence :name do |n|
      "role#{n}"
    end
  end
end
