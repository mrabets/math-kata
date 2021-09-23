class Task < ApplicationRecord
  belongs_to :user
  has_many   :tags
  has_many_attached: images
end
