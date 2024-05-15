class CreateJoinTableUsersBooks < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :books do |t|
      t.integer :rating
      t.string :comment
    end
  end
end
