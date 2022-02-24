class Supplier < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :books
  has_many :authors, through: :books
end
