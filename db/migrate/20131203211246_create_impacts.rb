class CreateImpacts < ActiveRecord::Migration
  def change
    create_table :impacts do |t|
      t.text :detail
      t.integer :food_id
      t.string :source_code
      t.string :destination_code

      t.timestamps
    end
  end
end
