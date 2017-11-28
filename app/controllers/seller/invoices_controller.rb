class Seller::InvoicesController < ApplicationController
  def index
    @invoice = Invoice.new
    @invoices = invoices
    @installments = Installment.all
  end

  def new
    @invoice = Invoice.new
    @invoice.installments.build
  end

  def create
    if params[:invoice][:xml_file].present?
      @invoice = Invoice.from_file(params[:invoice][:xml_file])

      if @invoice.nil?
        redirect_to new_seller_invoice_payer_path
        return
      end

    else
      @invoice = Invoice.new(invoice_params)
      @invoice.invoice_payer = invoice_payer
      @invoice.seller = current_user.seller
      @invoice.save!
    end

    redirect_to seller_path
  end

  def show

  end

  private

  def invoice_params
    params.require(:invoice).permit(:number, :total_value, installments_attributes: [:id, :number, :value, :due_date, :_destroy])
  end

  def invoices
    current_user.seller.invoices
  end

  def invoice_payer
    InvoicePayer.find(params.require(:invoice).permit(:invoice_payer)[:invoice_payer])
  end
end
