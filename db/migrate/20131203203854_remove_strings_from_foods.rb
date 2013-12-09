class RemoveStringsFromFoods < ActiveRecord::Migration
  def change
    remove_column :foods, :source, :string
    remove_column :foods, :detail_source, :string
  end
end
