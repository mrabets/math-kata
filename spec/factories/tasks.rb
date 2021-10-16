FactoryBot.define do
  factory :task do
    title { "Find factorial of 10" }
    answers { '120;120.0;120,0' }
    subject { 'Algebra' }
    condition { '<div class="trix-content"><div>In mathematics, the factorial of a non-negative integer n, denoted by n!, is the product of all positive integers less than or equal to n.</div></div>' }
    user
  end

  factory :user do
    name { "User" }
    password { '1111111' }
    password_confirmation { '1111111' }
  end
end