class Api::V1::BidsController < Api::ApplicationController
  before_action :authenticate_user!, only: [ :create ]
  before_action :authorize_user!, only: [ :create ]

  def create
    auction = Auction.find params[:auction_id]
    bid = Bid.new bid_params

    bid.auction = auction
    bid.user =  current_user

    bid.save
    render json: auction
  end

  private

  def bid_params
    params.require(:bid).permit(:price)
  end

  def auction
    Auction.find params[:auction_id]
  end

  def authorize_user!
    unless can? :bid, auction
      render(json: { errors: ["Unauthorized"] }, status: 401)
    end
  end
end
