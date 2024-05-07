class AddKindToBook < ActiveRecord::Migration[7.1]
  def change
    add_reference :books, :kind, null: false, foreign_key: true
  end
end
