class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :healthcare_provider_id
      t.integer :patient_id
      t.datetime :visit_datetime

      t.timestamps
    end
  end
end
