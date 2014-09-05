class ListsNetworkPartners < ActiveRecord::Migration
  def change
  	create_table :lists_network_partners, :id => false do |t|
  		t.integer :list_id
  		t.integer :network_partner_id
  	end
  end
end
