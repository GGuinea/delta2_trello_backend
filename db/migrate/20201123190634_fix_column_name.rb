class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :boards, :descripton, :description
  end
end
