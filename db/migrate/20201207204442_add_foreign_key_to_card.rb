class AddForeignKeyToCard < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cards, :columns
  end
end
