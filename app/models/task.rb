class Task < ApplicationRecord
  include PgSearch

  validates :title, :condition, :answers, :subject, presence: true
  validates :answers, answers: true 

  belongs_to :user
  has_many   :comments

  acts_as_taggable_on :tags

  has_many   :ratings

  has_many_attached :images

  has_rich_text :condition

  pg_search_scope :search_for, against: %i(title subject), associated_against: {
    rich_text_condition: [:body],
    comments: %i(message)
  }, 
  using: {
    tsearch: { prefix: true, any_word: true }
  }

 end
