class UsersController < ApplicationController
  def show
    @invoice = Invoice.new
    @user = current_user
    welcome_message unless @user.seller_id
  end

  private

  def welcome_message
    flash[:notice] = "Please complete your profile <a href=#{new_user_seller_path}>
    here</a>".html_safe
  end
end


