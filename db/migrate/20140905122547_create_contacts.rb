class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :job_title
      t.references :network_partner, index: true

      t.timestamps
    end
  end
end
