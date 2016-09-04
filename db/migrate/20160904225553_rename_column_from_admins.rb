class RenameColumnFromAdmins < ActiveRecord::Migration
  def change
    rename_column :admins, :read_terms, :terms
  end
end
