class AddColorToLabels < ActiveRecord::Migration[6.0]
  def change
    add_column :labels, :color, :string
  end
end
