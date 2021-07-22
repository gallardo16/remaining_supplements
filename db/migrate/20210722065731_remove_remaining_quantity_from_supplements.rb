class RemoveRemainingQuantityFromSupplements < ActiveRecord::Migration[6.0]
  def change
    remove_column :supplements, :remaining_quantity, :integer
  end
end
