FactoryGirl.define do
  factory :admin do
    email 'admin@admin.com'
    password 'password'
    password_confirmation 'password'
    full_name 'Frank Smith'
  end
end
