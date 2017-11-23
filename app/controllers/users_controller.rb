class UsersController < ApplicationController
  def show
    @invoice = Invoice.new
    @user = current_user
    welcome_message unless @user.seller_id
  end

  private

  def welcome_message
    flash[:notice] = "You need to complete your financial information before
    being able to upload invoices. Please head over to the
    <a href=#{new_user_seller_path}> Financial Information.</a>".html_safe
  end
end


