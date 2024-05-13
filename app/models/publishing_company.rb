class PublishingCompany < ApplicationRecord
  has_many :books

  paginates_per 15

  def as_json(options={})
    super(
      root: true,
      include: {
        books: {only: [:cover, :title]}
      }
    )
  end
end
