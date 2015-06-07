class Estatecolumnname < ActiveRecord::Migration
  def change
    rename_column :districts, :estate, :state
  end
end
