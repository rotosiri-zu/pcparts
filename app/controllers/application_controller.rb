class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  before_action :set_search
  before_action :set_category_list
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
    end

    def set_search
      @pagenumber = 5
      @q = Post.all.ransack(params[:q])
      @posts = @q.result(distinct: true).order(id: "DESC").page(params[:page]).per(@pagenumber)
    end

    def set_category_list
      @category_parent_array = Category.where(ancestry: nil)
    end

    def record_not_found
      flash[:error] = "ご指定のページが見つかりません"
      redirect_back(fallback_location: root_path)
    end
end
