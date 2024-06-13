class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string  :product_title
      t.integer :product_id
      t.decimal :product_price
      t.string  :product_type
      t.boolean :tm_in_image, default: false
      t.boolean :tm_in_title, default: false
      t.boolean :tm_in_description, default: false
      t.boolean :design_patent, default: false
      t.boolean :utility_patent, default: false
      t.boolean :copyright_images, default: false
      t.boolean :copyright_texts, default: false
      t.boolean :fba, default: false
      t.integer :items_sold
      t.string  :notes
      t.boolean :trademark_used, default: false
      t.boolean :proof_of_sale, default: false
      t.boolean :should_sue, default: false
      t.string  :copyright_usage_filenames
      t.string  :tm_registration_number
      t.integer :defendant_id
      t.timestamps
    end


  end
end
