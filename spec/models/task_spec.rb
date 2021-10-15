require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:task) do
    described_class.new(
      title: 'Find factorial of 10',
      answers: '120;120.0;120,0',
      user_id: user.id,
      subject: 'Algebra',
      condition: '<div class="trix-content"><div>In mathematics, the factorial of a non-negative integer n, denoted by n!, is the product of all positive integers less than or equal to n.</div></div>'
    )
  end

  let(:user) { User.create!({ email: 'example3@mail.com', password: '111111', password_confirmation: '111111' }) }

  it 'title should be present' do
    task.title = nil
    expect(task).not_to be_valid
  end

  it 'answers should be present' do
    task.answers = nil
    expect(task).not_to be_valid
  end

  it 'user id should be present' do
    task.user_id = nil
    expect(task).not_to be_valid
  end

  it 'subject should be present' do
    task.subject = nil
    expect(task).not_to be_valid
  end

  it 'condition should be present' do
    task.condition = nil
    expect(task).not_to be_valid
  end

  it 'title should not be too short' do
    task.title = 'a'
    expect(task).not_to be_valid
  end

  it 'title should not be too long' do
    task.title = 'a' * 60
    expect(task).not_to be_valid
  end
end
