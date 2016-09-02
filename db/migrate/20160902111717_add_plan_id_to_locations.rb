class AddPlanIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :plan_id, :string
  end
end
