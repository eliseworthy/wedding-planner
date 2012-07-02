class CreateUserKeys < ActiveRecord::Migration
  def change
    create_table :user_keys do |t|
      t.string :api_key

      t.timestamps
    end
  end
end
