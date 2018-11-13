class AddImageToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :image, :string
  end
end
