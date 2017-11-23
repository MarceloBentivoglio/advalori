class InvoicePayersController < ApplicationController
  def index
    @invoice_payers = invoice_payers
  end

  def new
    @invoice_payer = InvoicePayer.new
  end

  def create
    @invoice_payer = InvoicePayer.new(invoice_payer_params)
    if @invoice_payer.save
      redirect_to user_path
    else
      render :new
    end
  end

  def show
    @invoice_payers = InvoicePayer.all
  end

  private

  def invoice_payer_params
    params.require(:invoice_payer).permit(:cnpj, :name, :address, :address_number, :address_complement, :neighborhood, :city, :state, :zip_code, :phone_number, :number_of_employees)
  end

  def invoice_payers
    current_user.seller.invoice_payers
  end
end
