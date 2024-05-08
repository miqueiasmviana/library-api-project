class BookSerializer < ActiveModel::Serializer
  attributes :id, :cover, :title, :description, :pages, :first_published

  def attributes(*args)
    h = super(*args)
    h[:first_published] = object.first_published.to_time.iso8601 unless object.first_published.blank?
    h
  end
end
