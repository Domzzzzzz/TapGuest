class RemoveColumnFromAdmins < ActiveRecord::Migration
  def change
    remove_column :admins, :terms, :boolean
  end
end
