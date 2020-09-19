class Admin::BadgesController < Admin::BaseController
  before_action :current_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end
  
  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image_ref, :test_passages_amount, :level, :category_id)
  end

  def current_badge
    @badge = Badge.find(params[:id])
  end

  # def all_badges
  #   @badges = Badge.all
  # end
end
