class API::SupplementsController < APIController
  before_action :authenticate_user!

  def index
    @supplements = current_user.supplements
  end
end
