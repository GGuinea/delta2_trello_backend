class CreateColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :columns do |t|
      t.string :name

      t.timestamps
    end
  end
end
