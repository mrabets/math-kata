require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to :task }
  end

  describe 'validations' do
    it { should validate_presence_of(:message) }

    it do
      should validate_length_of(:message).is_at_least(1).is_at_most(200)
    end
  end
end
