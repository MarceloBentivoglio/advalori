class UsersController < ApplicationController
  def show
    @invoice = Invoice.new
    @user = current_user
  end
end
