class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :address_1
      t.string :address_2
      t.string :zip_code
      t.string :state
      t.string :city
      t.string :medication

      t.timestamps
    end
  end
end
