class AddAuctionRefToBids < ActiveRecord::Migration[5.2]
  def change
    add_reference :bids, :auction, foreign_key: true
  end
end
