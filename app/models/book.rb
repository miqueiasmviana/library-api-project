class Book < ApplicationRecord
  has_many :kinds
  belongs_to :author
end
