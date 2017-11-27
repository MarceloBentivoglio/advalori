class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource


  def after_sign_in_path_for(resource)
    if current_user.is_seller
      if current_user.seller
        seller_path
      else
        new_seller_path
      end
    else
      if current_user.investor
        new_investor_path
      else
        new_investor_path
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_seller])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :cpf, :phone_number])
  end

  private

  def layout_by_resource
    if devise_controller?
      "home"
    else
      "application"
    end
  end
end


