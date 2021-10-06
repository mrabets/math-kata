class Task < ApplicationRecord
  include PgSearch

  validates :title, :condition, :answers, :subject, presence: true
  validates :answers, answers: true 

  belongs_to :user
  has_many   :comments
  has_many   :tags
  accepts_nested_attributes_for :tags
  has_many   :ratings

  has_many_attached :images

  has_rich_text :condition

  pg_search_scope :search_for, against: %i(title subject), associated_against: {
    rich_text_condition: [:body],
    comments: %i(message),
    tags: %i(name)
  }, 
  using: {
    tsearch: { prefix: true, any_word: true }
  }

 end
