class Author < ApplicationRecord
  has_many :books, -> { order(year_published: :desc) }
  validates :first_name, :last_name, presence: true, uniqueness: true, length: { in: 3..10 }
end
