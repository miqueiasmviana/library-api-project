class CreatePublishingCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :publishing_companies do |t|
      t.string :company_name

      t.timestamps
    end
  end
end
