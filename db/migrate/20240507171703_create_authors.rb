class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :picture
      t.string :name
      t.text :biography

      t.timestamps
    end
  end
end
