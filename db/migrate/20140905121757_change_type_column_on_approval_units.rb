class ChangeTypeColumnOnApprovalUnits < ActiveRecord::Migration
  def change
  	rename_column :approval_units, :type, :format
  end
end
