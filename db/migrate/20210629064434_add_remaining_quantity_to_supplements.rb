class AddRemainingQuantityToSupplements < ActiveRecord::Migration[6.0]
  def change
    add_column :supplements, :remaining_quantity, :integer, null: false
  end
end
