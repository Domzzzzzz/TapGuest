class AddTermsToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :read_terms, :boolean, null: false, default: false
  end
end
