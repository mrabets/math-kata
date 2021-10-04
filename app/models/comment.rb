class Comment < ApplicationRecord
  belongs_to :task
  acts_as_votable

  validates :message, presence: true
end
