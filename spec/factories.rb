FactoryGirl.define do
  factory :admin do
    email 'admin@admin.com'
    password 'password'
    password_confirmation 'password'
  end
end
