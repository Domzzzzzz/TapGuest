class RemoveManagerFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :manager, :boolean
  end
end
