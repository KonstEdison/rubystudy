class RenameProductColumns < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :product_title, :title
    rename_column :products, :product_price, :price
    rename_column :products, :product_type, :type
    rename_column :products, :product_id, :marketplace_id

    # Add a foreign key constraint to defendant_id
    add_foreign_key :products, :defendants, column: :defendant_id
  end
end
