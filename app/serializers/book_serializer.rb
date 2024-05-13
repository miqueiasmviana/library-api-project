class BookSerializer < ActiveModel::Serializer
  attributes :id, :cover, :title, :description, :pages, :first_published

  belongs_to :kind do
    link(:related) { book_kind_url(object.id)}
  end

  belongs_to :author, optional: true do
    link(:related) { book_author_url(object.id)}
  end

  belongs_to :publishing_company, optional: true do
    link(:related) { book_publishing_company_url(object.id)}
  end
  

  def attributes(*args)
    h = super(*args)
    h[:first_published] = object.first_published.to_time.iso8601 unless object.first_published.blank?
    h
  end
end
