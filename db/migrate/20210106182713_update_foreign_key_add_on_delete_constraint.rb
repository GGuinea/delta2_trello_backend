class UpdateForeignKeyAddOnDeleteConstraint < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :tasks, :cards
    add_foreign_key :tasks, :cards, on_delete: :cascade
    remove_foreign_key :cards, :columns
    add_foreign_key :cards, :columns, on_delete: :cascade
  end
end
