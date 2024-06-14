class CreateDefendants < ActiveRecord::Migration[7.1]
  def change
    create_table :defendants do |t|
      t.string :name
      t.string :marketplace_id
      t.string :location
      t.string :feedback
      t.string :notes
      t.timestamps
    end
  end
end
