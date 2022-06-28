class Library < ApplicationRecord
  has_many :authors, dependent: :destroy
  has_many :books, through: :authors
  validates :name, presence: true
  validates :address, presence: true
end
