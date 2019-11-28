class AddRelationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :relation, :string
  end
end
