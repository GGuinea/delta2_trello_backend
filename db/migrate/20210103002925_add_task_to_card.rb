class AddTaskToCard < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :card
  end
end
