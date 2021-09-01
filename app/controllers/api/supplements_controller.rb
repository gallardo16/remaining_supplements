class Api::SupplementsController < ApiController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { error: '404 not found' }, status: 404
  end

  def index
    @supplements = current_user.supplements
  end
end
