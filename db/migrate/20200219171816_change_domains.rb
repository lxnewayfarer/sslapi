# lil changes
class ChangeDomains < ActiveRecord::Migration[6.0]
  def change
    add_column :domains, :expire, :integer
    add_column :domains, :status, :boolean
    add_column :domains, :current_state, :text
    remove_column :domains, :param, :text
    remove_column :domains, :isok, :boolean
    remove_column :domains, :error, :text
  end
end
