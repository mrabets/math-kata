require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :task }
  end

  describe 'validations' do
    it { should validate_presence_of(:score) }

    it do
      expect(subject).to validate_numericality_of(:score).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5)
    end
  end
end
