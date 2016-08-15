class RemoveColumnsFromAdmins < ActiveRecord::Migration
  def change
    remove_column :admins, :manager, :boolean
    remove_column :admins, :active, :boolean
  end
end
