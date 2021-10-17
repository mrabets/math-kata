require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should have_many :comments }
    it { should have_many :ratings }
    it { should have_many :tags }
    it { should have_rich_text :condition }
    it { should belong_to :user }
  end

  describe 'validations' do
    subject(:task) { build(:task) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:answers) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:condition) }

    it do
      expect(task).to validate_length_of(:title).is_at_least(2).is_at_most(59)
    end

    it { should validate_uniqueness_of(:title) }
  end
end
