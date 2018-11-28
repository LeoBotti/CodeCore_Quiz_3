class Api::V1::AuctionsController < Api::ApplicationController
  before_action :authenticate_user!, only: [ :create, :destroy ]
  before_action :authorize_user!, only: [ :destroy ]
  
  def create
    auction = Auction.new auction_params
    auction.user = current_user
    
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

  def authorize_user!
    unless can? :crud, auction
      render(json: { errors: ["Unauthorized"] }, status: 401)
    end
  end
end