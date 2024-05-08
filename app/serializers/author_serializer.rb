class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :picture, :name, :biography
end
