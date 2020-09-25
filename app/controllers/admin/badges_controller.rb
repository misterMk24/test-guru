class Admin::BadgesController < Admin::BaseController
  before_action :current_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end
  
  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :level,:category_id, 
                                  :test_passages_amount, :first_attempt, :image_ref)
  end

  def current_badge
    @badge = Badge.find(params[:id])
  end

  # def all_badges
  #   @badges = Badge.all
  # end
end
