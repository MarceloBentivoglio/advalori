class SellersController < ApplicationController

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      current_user.seller_id = @seller
      current_user.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def seller_params
    params.require(:seller).permit(:cnpj, :name, :address, :address_number, :address_complement, :neighborhood, :city, :state, :zip_code, :phone_number, :number_of_employees)
  end

end
