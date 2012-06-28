class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text    :description
      t.string  :url
      t.string  :photo_url
      t.string  :location
      t.integer :wedding_id

      t.timestamps
    end
  end
end
