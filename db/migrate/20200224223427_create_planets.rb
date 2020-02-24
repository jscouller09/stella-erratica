class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :description
      t.integer :rate
      t.integer :capacity
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true
      t.references :environment, foreign_key: true

      t.timestamps
    end
  end
end
