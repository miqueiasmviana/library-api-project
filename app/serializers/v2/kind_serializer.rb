module V2
  class KindSerializer < ActiveModel::Serializer
    attributes :id, :genre

    has_many :books
  end
end