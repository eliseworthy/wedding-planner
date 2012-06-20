class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def up
    Category.create([
      {name: "Bridal Gown"},
      {name: "Venue"},
      {name: "Honeymoon"},
      {name: "Ring"},
      {name: "Bridesmaids"},
      {name: "Decorations"},
      {name: "Floral"},
      {name: "Cake"},
      {name: "Invitations"}
    ])
  end
end
