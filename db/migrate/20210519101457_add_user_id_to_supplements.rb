class AddUserIdToSupplements < ActiveRecord::Migration[6.0]
  def up
    add_reference :supplements, :user, null: false, index: true
 end

  def down
    remove_reference :supplements, :user, index: true
  end
end
