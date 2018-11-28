class BidSerializer < ActiveModel::Serializer
  attributes :id, :price

  belongs_to :user
  belongs_to :auction
end
