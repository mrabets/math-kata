class Task < ApplicationRecord
  validates :title, :condition, :answers, :subject, presence: true
  validates :answers, answers: true 

  belongs_to :user
  has_many   :tags
  accepts_nested_attributes_for :tags

  has_many_attached :images
end
