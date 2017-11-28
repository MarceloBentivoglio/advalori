class SellersController < ApplicationController

  def index
    @sellers = Seller.all
  end

  def show
    @invoice = Invoice.new
    @invoices = current_user.seller.invoices.order(created_at: :desc).first(3)
  end

  def new
    redirect_to edit_seller_path if current_user.seller

    @user = current_user
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save && current_user.seller.nil? # Check if user doesnt have a seller
      current_user.seller = @seller
      current_user.save
      redirect_to seller_path
    else
      redirect_to new_seller_path
    end

  end

  def edit
    @seller = current_user.seller

  end

  def update
    @seller = Seller.find(current_user)
    @seller.update(seller_params)

    redirect_to seller_path
    success_message
  end

  private

  def seller_params
    params.require(:seller).permit(:cnpj, :name, :address, :address_number, :address_complement, :neighborhood, :city, :state, :zip_code, :phone_number, :number_of_employees)
  end

  def success_message
    flash[:notice] = "Your profile has been successfully updated"
  end

end
