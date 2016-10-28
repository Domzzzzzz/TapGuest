class AddSubscriptionIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :subscription_id, :string
  end
end
