class Seller::InvoicePayersController < ApplicationController
  def index
    @invoice_payers = current_user.seller.invoice_payers
  end

  def new
    @invoice_payer = InvoicePayer.new
  end

  def create
    @invoice_payer = InvoicePayer.new(invoice_payer_params)
    @invoice_payer.seller = current_user.seller
    if @invoice_payer.save
      redirect_to seller_path
    else
      render :new
    end
  end

  def show
    @invoice_payers = InvoicePayer.all
  end

  def destroy
    @invoice_payer = InvoicePayer.find(params[:id])
    @invoice_payer.destroy
    redirect_to seller_invoice_payers_path
  end

    def edit
    @invoice_payer = InvoicePayer.find(params[:id])

  end

  def update
    @invoice_payer = InvoicePayer.find(current_user.seller.invoice_payers)
    @invoice_payer.update(invoice_payer_params)
    redirect_to seller_invoice_payer_path
    sucess_message
  end

  private

  def invoice_payer_params
    params.require(:invoice_payer).permit(:cnpj, :name, :address, :address_number, :address_complement, :neighborhood, :city, :state, :zip_code, :phone_number, :number_of_employees)
  end

  def invoice_payers
    current_user.seller.invoice_payers
  end
end
