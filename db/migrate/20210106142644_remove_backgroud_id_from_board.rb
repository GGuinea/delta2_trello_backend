class RemoveBackgroudIdFromBoard < ActiveRecord::Migration[6.0]
  def change
    rename_column :boards, :backgroud_id, :background_id
  end
end
