module V1
  class KindSerializer < ActiveModel::Serializer
    attributes :id, :genre

    has_many :books
  end
end