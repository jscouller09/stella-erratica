class ChangeAdminDefaultToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :admin, from: '', to: false
  end
end
