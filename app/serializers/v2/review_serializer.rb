class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment
  has_one :user, only: [:id, :email]
  has_one :book
end
