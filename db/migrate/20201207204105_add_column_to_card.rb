class AddColumnToCard < ActiveRecord::Migration[6.0]
  def change
    add_reference :cards, :column
  end
end
