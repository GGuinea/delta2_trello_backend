class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.string :name
      t.integer :color_id, :default => 0

      t.timestamps
    end
  end
end
