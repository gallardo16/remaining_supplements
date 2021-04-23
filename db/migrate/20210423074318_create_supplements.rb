class CreateSupplements < ActiveRecord::Migration[6.0]
  def change
    create_table :supplements do |t|
      t.string :name, null: false
      t.integer :supplement_type, null: false
      t.integer :content_size, null: false
      t.integer :daily_intake, null: false
      t.integer :remind, null: false

      t.timestamps
    end
  end
end
