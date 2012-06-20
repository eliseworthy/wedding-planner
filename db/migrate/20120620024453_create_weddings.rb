class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
