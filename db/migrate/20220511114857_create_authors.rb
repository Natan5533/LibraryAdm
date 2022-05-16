class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.belongs_to :library, foreign_key: true
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
