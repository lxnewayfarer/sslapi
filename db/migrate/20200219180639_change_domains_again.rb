# lil more changes
class ChangeDomainsAgain < ActiveRecord::Migration[6.0]
  def change
    add_column :domains, :expire_days, :integer
    remove_column :domains, :expire, :integer
  end
end
