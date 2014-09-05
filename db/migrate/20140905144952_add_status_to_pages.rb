class AddStatusToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :status, :string, default: "Draft"
  end
end
