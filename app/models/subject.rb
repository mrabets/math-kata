class Subject < ApplicationRecord
  validates :name, presence: true, length: { in: 2..20 }
end
