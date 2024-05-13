module V2
  class PublishingCompanySerializer < ActiveModel::Serializer
    attributes :id, :company_name

    has_many :books
  end
end