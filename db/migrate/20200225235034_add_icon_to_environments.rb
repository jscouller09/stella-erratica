class AddIconToEnvironments < ActiveRecord::Migration[5.2]
  def change
    add_column :environments, :icon, :string
  end
end
