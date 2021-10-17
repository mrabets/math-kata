require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many :tasks }
    it { should have_many :solved_tasks }
    it { should have_many :ratings }
    it { should have_many :votes }
  end

  describe 'validations' do
    subject(:user) { build(:user) }

    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:name) }
  end
end
