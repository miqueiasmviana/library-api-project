class Kind < ApplicationRecord
  has_many :books

  def as_json(options={})
    super(
      root: true,
      include: {
        books: {only: [:cover, :title]}
      }
    )
  end
end
