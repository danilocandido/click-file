class CreateFileSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :file_systems do |t|
      t.boolean :file, null: false, default: true
      t.references :folder, index: true

      t.timestamps
    end
  end
end
