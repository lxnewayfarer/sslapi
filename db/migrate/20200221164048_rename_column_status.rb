class RenameColumnStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :domains, :status, :status_is_fine
  end
end
