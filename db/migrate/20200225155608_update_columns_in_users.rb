class UpdateColumnsInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :role, :string
    add_column :users, :traveller, :boolean, default: true
    add_column :users, :overlord, :boolean, default: false
  end
end
