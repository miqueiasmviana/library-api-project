class Book < ApplicationRecord

  validates_presence_of :kind
  validates_presence_of :author
  validates_presence_of :publishing_company

  has_many :reviews
  has_many :users, through: :reviews
  
  belongs_to :kind #, optional: true
  belongs_to :author #, optional: true
  belongs_to :publishing_company #, optional: true

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
