class CreateCardsLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :cards_labels do |t|
      t.belongs_to :card, index: true
      t.belongs_to :label, index: true

      t.timestamps
    end
  end
end
