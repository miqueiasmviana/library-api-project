class CreateKinds < ActiveRecord::Migration[7.1]
  def change
    create_table :kinds do |t|
      t.string :genre

      t.timestamps
    end
  end
end
