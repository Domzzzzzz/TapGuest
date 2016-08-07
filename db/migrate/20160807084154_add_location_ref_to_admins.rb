class AddLocationRefToAdmins < ActiveRecord::Migration
  def change
    add_reference :admins, :location, index: true, foreign_key: true
  end
end
