class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :contact, index: true
      t.references :approval_unit, index: true
      t.boolean :visible

      t.timestamps
    end
  end
end
