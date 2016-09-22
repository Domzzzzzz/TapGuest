class AddPartiesToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :parties, :integer
  end
end
