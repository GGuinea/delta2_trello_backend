class AddDescriptionToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :descripton, :text
  end
end
