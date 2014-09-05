class CreateNetworkPartners < ActiveRecord::Migration
  def change
    create_table :network_partners do |t|
      t.string :name
      t.string :urn

      t.timestamps
    end
  end
end
