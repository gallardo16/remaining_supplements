class ChangeDataSupplementTypeToSupplement < ActiveRecord::Migration[6.0]
  def change
    change_column :supplements, :supplement_type, :string
  end
end
