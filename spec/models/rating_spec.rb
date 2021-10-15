require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject(:rating) { described_class.new(score: 3, user_id: user.id, task_id: task.id) }

  let(:user) { User.create!({ email: 'example3@mail.com', password: '111111', password_confirmation: '111111' }) }
  let(:task) do
    Task.create!(
      title: 'Find factorial of 10',
      answers: '120;120.0;120,0',
      user_id: user.id,
      subject: 'Algebra',
      condition: '<div class="trix-content"><div>In mathematics, the factorial of a non-negative integer n, denoted by n!, is the product of all positive integers less than or equal to n.</div></div>'
    )
  end

  it 'score should be present' do
    rating.score = nil
    expect(rating).not_to be_valid
  end

  it 'user id should be present' do
    rating.user_id = nil
    expect(rating).not_to be_valid
  end

  it 'task id should be present' do
    rating.task_id = nil
    expect(rating).not_to be_valid
  end

  it 'score should not be less than 0' do
    rating.score = -1
    expect(rating).not_to be_valid
  end

  it 'score should not be more than 5' do
    rating.score = 6
    expect(rating).not_to be_valid
  end
end
