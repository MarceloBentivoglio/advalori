class SellersController < ApplicationController

  def index
    @sellers = Seller.all
  end

  def new
    @user = current_user
    @seller = Seller.new
  end

  def show
    @seller = Seller.find(current_user)
  end

  def update
    @seller = Seller.find(current_user)
    @seller.update(seller_params)

    redirect_to user_path
    sucess_message
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      current_user.seller = @seller
      current_user.save
      redirect_to user_path
    else
      render :new
    end
  end

  private

  def seller_params
    params.require(:seller).permit(:cnpj, :name, :address, :address_number, :address_complement, :neighborhood, :city, :state, :zip_code, :phone_number, :number_of_employees)
  end

   def sucess_message
    flash[:notice] = "Your profile has been successfully updated"
  end

end
