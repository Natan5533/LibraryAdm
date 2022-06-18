class Author < ApplicationRecord
    has_many :books, dependent: :destroy
    belongs_to :library
    validates :name, presence: true
    validates :email, presence: true
end
