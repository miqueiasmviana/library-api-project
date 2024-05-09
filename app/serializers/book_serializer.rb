class BookSerializer < ActiveModel::Serializer
  attributes :id, :cover, :title, :description, :pages, :first_published

  belongs_to :kind do
    link(:related) { kind_url(object.kind.id)}
  end

  belongs_to :author, optional: true do
    link(:related) { author_url(object.author.id)}
  end

  belongs_to :publishing_company, optional: true do
    link(:related) { publishing_company_url(object.publishing_company.id)}
  end
  

  def attributes(*args)
    h = super(*args)
    h[:first_published] = object.first_published.to_time.iso8601 unless object.first_published.blank?
    h
  end
end
