FactoryBot.define do
  factory :user do
    email { 'email@example.com' }
    password { '1111111' }
    password_confirmation { '1111111' }
  end
end
