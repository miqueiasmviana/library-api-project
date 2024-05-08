class Author < ApplicationRecord
  has_many :books #, optional: true

  def as_json(options={})
    super(
      root: true,
      include: {
        books: {only: [:cover, :title]}
      }
    )
  end
end