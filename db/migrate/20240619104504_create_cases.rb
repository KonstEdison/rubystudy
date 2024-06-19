class CreateCases < ActiveRecord::Migration[7.1]
  def change
    create_table :cases do |t|
      t.string :edison_case_code
      t.string :brand_name
      t.string :client_name
      t.string :law_firm

      t.timestamps
    end

    # Add case_id to defendants table
    add_reference :defendants, :case, foreign_key: true
  end
end
