class RemoveColorIdFromLabels < ActiveRecord::Migration[6.0]
  def change
    remove_column :labels, :color_id, :integer
  end
end
