class RemovePartiesFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :parties, :integer
  end
end
