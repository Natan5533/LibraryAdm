class Author < ApplicationRecord
    has_many :books, dependent: :destroy
    belongs_to :library
end
