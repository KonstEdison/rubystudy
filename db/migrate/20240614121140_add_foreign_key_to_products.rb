class AddForeignKeyToProducts < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :products, :defendants, column: :defendant_id
  end
end
