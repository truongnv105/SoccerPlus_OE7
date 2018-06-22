class ApplicationController < ActionController::Base
  layout :layout_by_resource

  before_action :authenticate_user!, except: %i(index show)
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search_team

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :address, :phone_number]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  def set_search_team
    @q = Team.ransack params[:q]
    @teams = @q.result.page(params[:page]).per Settings.per.limit_page
  end

  def after_sign_out_path_for(resource_or_scope)
    URI.parse(request.referer).path if request.referer
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
