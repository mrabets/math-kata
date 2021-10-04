class Comment < ApplicationRecord
  belongs_to :task
  has_many :likes, dependent: :destroy

  validates :message, presence: true
end
