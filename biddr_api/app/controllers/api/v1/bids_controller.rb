class Api::V1::BidsController < Api::ApplicationController
  def create
    auction = Auction.find params[:auction_id]
    bid = Bid.new bid_params

    bid.auction = auction
    bid.user = User.last # current_user

    bid.save
    render json: auction
  end

  private

  def bid_params
    params.require(:bid).permit(:price)
  end
end
