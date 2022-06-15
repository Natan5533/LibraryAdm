class RestrictionForLibrariesName < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:libraries, :name, false)
  end
end
