module V2
  class AuthorSerializer < ActiveModel::Serializer
    attributes :id, :picture, :name, :biography

    has_many :books
  end
end