class AddBackgroudIdToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :backgroud_id, :integer, :default => 0
  end
end
