class AddBoardToLabels < ActiveRecord::Migration[6.0]
  def change
    add_reference :labels, :board, null: false, foreign_key: true
  end
end
