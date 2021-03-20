class ApplicationController < ActionController::Base
  include Pagy::Backend      
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html{
        redirect_to root_path, alert: exception.message
      }
    end
  end
       
  protected
      
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name , address_attributes: [:state ,:suburb ,:address ,:postcode ]])
        end

        def set_categories
          @categories=Category.all
        end
end

