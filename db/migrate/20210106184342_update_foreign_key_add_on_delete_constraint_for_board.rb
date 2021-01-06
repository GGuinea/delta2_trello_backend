class UpdateForeignKeyAddOnDeleteConstraintForBoard < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :labels, :boards
    add_foreign_key :labels, :boards, on_delete: :cascade
  end
end
