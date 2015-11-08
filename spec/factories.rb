FactoryGirl.define do
  factory :admin do
    sequence :email do |n|
      "admin#{n}@admin.com"
    end
    password 'password'
    password_confirmation 'password'
    full_name 'Frank Smith'
  end
end
