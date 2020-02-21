# creating domains
class CreateDomains < ActiveRecord::Migration[6.0]
  def change
    create_table :domains do |t|
      t.string :domain
      t.boolean :isok
      t.text :error
      t.string :param
      t.timestamps
    end
  end
end
