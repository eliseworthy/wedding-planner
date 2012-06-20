class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.text :description
      t.integer :price
      t.integer :wedding_id

      t.timestamps
    end
  end
end
