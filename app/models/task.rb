class Task < ApplicationRecord
  validates :title, :condition, :answers, presence: true 

  belongs_to :user
  has_many   :tags
  accepts_nested_attributes_for :tags

  has_many_attached :images
end
