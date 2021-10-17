require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }

    it do
      expect(subject).to validate_length_of(:name).is_at_least(2).is_at_most(20)
    end
  end
end
