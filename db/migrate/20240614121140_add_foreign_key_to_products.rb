class AddForeignKeyToProducts < ActiveRecord::Migration[7.1]
  def change
    # Check if the foreign key constraint already exists
    unless foreign_key_exists?(:products, :defendants, column: :defendant_id)
      add_foreign_key :products, :defendants, column: :defendant_id
    end
  end
end
