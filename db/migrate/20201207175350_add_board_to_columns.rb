class AddBoardToColumns < ActiveRecord::Migration[6.0]
  def change
    add_reference :columns, :board
  end
end
