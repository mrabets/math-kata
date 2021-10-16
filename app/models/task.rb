class Task < ApplicationRecord
  include PgSearch

  validates :title, :condition, :answers, :subject, presence: true
  validates :title, length: { in: 2...60 }, uniqueness: true

  before_save :normalize_answers

  belongs_to :user
  has_many   :comments
  has_many :ratings
  acts_as_taggable_on :tags
  has_rich_text :condition

  pg_search_scope :search_for, against: %i[title subject], associated_against: {
    rich_text_condition: [:body],
    comments: %i[message]
  },
                               using: {
                                 tsearch: { prefix: true, any_word: true }
                               }

  private

  def normalize_answers
    self.answers.try(:delete!, ' ')
  end
end
