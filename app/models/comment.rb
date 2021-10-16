class Comment < ApplicationRecord
  validates :message, presence: true, length: { in: 1..200 }

  belongs_to :task
  acts_as_votable
end
