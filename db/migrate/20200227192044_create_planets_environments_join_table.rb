class CreatePlanetsEnvironmentsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :planets, :environments
  end
end
