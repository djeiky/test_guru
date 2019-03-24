class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:edit, :update, :destroy]
  before_action :get_images, only: [:new, :edit]

  
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private
    def get_images
      @images = Dir.glob("#{Rails.root}/app/assets/images/*").map {|i| i.split("/").last}
    end

    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :badge_type_id, :image, :level)
    end

end
