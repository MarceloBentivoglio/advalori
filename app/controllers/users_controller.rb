class UsersController < ApplicationController
  def show
    @invoice = Invoice.new
    @user = current_user
    welcome_message unless @user.seller_id
    @invoices = invoices
    @expenses = expenses
  end

  private

  def welcome_message
    flash[:notice] = "You need to complete your financial information before
    being able to upload invoices. Please head over to the
    <a href=#{new_user_seller_path}> Financial Information.</a>".html_safe
  end

  def invoice_params
    params.require(:invoice).permit(:number, :total_value, installments_attributes: [:id, :number, :value, :due_date, :_destroy])
  end

  def invoices
    current_user.seller.invoices
  end

  def expenses
    current_user.seller.expenses
  end
end


