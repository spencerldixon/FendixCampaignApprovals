class CreateApprovalUnits < ActiveRecord::Migration
  def change
    create_table :approval_units do |t|
      t.references :page, index: true
      t.string :type
      t.string :value
      t.integer :position

      t.timestamps
    end
  end
end
