FactoryBot.define do
  factory :task do
    title { 'Find factorial of 10' }
    answers { '120;120.0;120,0' }
    subject { 'Algebra' }

    condition do
      '<div class="trix-content">
         <div>In mathematics, the factorial of a non-negative integer n, denoted by n!,
          is the product of all positive integers less than or equal to n.
         </div>
       </div>'
    end
    user
  end
end
