FactoryGirl.define do
  factory :role do
    sequence :name do |n|
      "role#{n}"
    end
  end

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
end
