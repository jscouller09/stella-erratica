class ChangePlanetDescription < ActiveRecord::Migration[5.2]
  def change
    change_column :planets, :description, :text
  end
end
