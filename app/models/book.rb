class Book < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :kind
  belongs_to :author, optional: true
  belongs_to :publishing_company, optional: true

  paginates_per 15

  # accepts_nested_attributes_for :kinds, :author, :publishing_company

  def as_json(options={})
    super(
      root: true,
      include: {
        kind: { only: :genre }, 
        author: {only: :name},
        publishing_company: {only: :company_name}
      }
    )
  end
end
