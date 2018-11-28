class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  validates :price, presence: :true, numericality: { greater_than_or_equal_to: :valid_bid }

  def max_bid
    auction.bids.maximum('price')
  end

  def valid_bid
    if max_bid.present?
      max_bid + 1
    else
      auction.reserve_price
    end
  end
end
