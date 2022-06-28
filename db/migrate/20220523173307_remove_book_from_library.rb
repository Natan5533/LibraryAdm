class RemoveBookFromLibrary < ActiveRecord::Migration[7.0]
  def change
    remove_reference :books, :library, index: true, foreign_key: true
  end
end
