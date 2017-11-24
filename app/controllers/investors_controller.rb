class InvestorsController < ApplicationController

  def new
    @investor = Investor.new
  end

  def create
    @investor = Investor.new(investor_params)

    if @investor.save
      current_user.investor = @investor
      current_user.save
      redirect_to user_path
    else
      render :new
    end
  end

  def show
    @invoices = Invoice.where(status: "Available")

  end

  private

  def investor_params
    params.require(:investor).permit(:cnpj, :name, :address, :address_number, :address_complement, :neighborhood, :city, :state, :zip_code, :phone_number, :number_of_employees)
  end

end
