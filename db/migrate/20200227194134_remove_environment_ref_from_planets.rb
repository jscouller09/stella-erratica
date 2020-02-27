class RemoveEnvironmentRefFromPlanets < ActiveRecord::Migration[5.2]
  def change
    remove_reference :planets, :environment
  end
end
