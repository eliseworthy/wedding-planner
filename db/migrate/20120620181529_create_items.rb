class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :wedding_id
      t.integer :category_id

      t.timestamps
    end
  end
end
