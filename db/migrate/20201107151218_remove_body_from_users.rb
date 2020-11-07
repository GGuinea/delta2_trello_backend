class RemoveBodyFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :body, :text
  end
end
