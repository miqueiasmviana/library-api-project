class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :cover
      t.string :title
      t.text :description
      t.integer :pages
      t.date :first_published

      t.timestamps
    end
  end
end
