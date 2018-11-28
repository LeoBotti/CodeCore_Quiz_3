class Api::V1::AuctionsController < Api::ApplicationController
  def create
    auction = Auction.new auction_params
    auction.user = User.last # current_user
    
    auction.save
    render json: auction
  end

  def show
    render json: auction
  end

  def index
    render json: auctions
  end

  def destroy
    auction.destroy
    render json: auctions
  end

  private

  def auction
    Auction.find params[:id]
  end

  def auctions
    Auction.order created_at: :desc
  end

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price)
  end
end