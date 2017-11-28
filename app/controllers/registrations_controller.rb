class RegistrationsController < Devise::RegistrationsController
  def after_update_path_for(resource)
    if current_user.is_seller?
      seller_path
    else
      investor_path
    end
  end
end
