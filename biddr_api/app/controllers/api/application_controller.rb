class Api::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token

  private
  def authenticate_user!
    unless user_signed_in?
      render(json: { errors: ["Unauthorized"] }, status: 401)
    end
  end
end
