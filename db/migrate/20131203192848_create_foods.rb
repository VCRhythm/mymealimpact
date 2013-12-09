class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :source
      t.string :detail_source

      t.timestamps
    end
  end
end
