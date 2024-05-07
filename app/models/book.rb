class Book < ApplicationRecord
  has_many :kinds
  belongs_to :author
  belongs_to :publishing_company
end
