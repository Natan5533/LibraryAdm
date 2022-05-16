class Library < ApplicationRecord
    has_many :authors, dependent: :destroy
end
