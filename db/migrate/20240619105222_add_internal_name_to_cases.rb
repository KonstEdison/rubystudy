class AddInternalNameToCases < ActiveRecord::Migration[7.1]
  def change
    add_column :cases, :internal_name, :string
  end
end
