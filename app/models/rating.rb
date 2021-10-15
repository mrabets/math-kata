class Rating < ApplicationRecord
  validates :score, presence: true
  validates :score, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  belongs_to :user
  belongs_to :task
end
