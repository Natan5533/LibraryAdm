class LibrarySerializer < ActiveModel::Serializer
  attributes :id, :name, :address
  has_many :authors
  has_many :books
end
