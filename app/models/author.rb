class Author < ApplicationRecord
  has_many :books #, optional: true

  # accepts_nested_attributes_for :books

end