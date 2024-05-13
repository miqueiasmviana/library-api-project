module V2
  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :content
  end
end