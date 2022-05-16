class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.belongs_to :author, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
