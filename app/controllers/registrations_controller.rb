class RegistrationsController < Devise::RegistrationsController

  def after_update_path_for(resource)
    seller_path
  end
end
