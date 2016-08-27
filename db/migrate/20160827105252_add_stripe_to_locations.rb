class AddStripeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :subscribed, :boolean, null: false, default: false
    add_column :locations, :stripe_id, :string, default: ""
  end
end
