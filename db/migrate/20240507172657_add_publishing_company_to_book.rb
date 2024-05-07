class AddPublishingCompanyToBook < ActiveRecord::Migration[7.1]
  def change
    add_reference :books, :publishing_company, null: false, foreign_key: true
  end
end
