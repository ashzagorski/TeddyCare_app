class CreateHealthcareProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :healthcare_providers do |t|
      t.string :name
      t.integer :position
      t.string :employee_number
      t.string :password_digest

      t.timestamps
    end
  end
end
