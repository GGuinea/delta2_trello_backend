class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members, id: false do |t|
      t.belongs_to :board, index: true
      t.belongs_to :user, index: true
    end
  end
end
