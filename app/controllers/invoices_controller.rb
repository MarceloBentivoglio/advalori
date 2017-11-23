class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
    @installments = Installment.all
  end

  def new
    @invoice = Invoice.new
  end

  def create
    if params[:invoice][:xml_file].present?
      @invoice = Invoice.from_file(params[:invoice][:xml_file])
    else
      @invoice = Invoice.new(invoice_params)
    end

    redirect_to user_path
  end

  private

  def invoice_params
    params.require(:invoice).permit()
  end
end
