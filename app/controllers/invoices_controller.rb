class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
    @installments = Installment.all
  end

  def new
    @invoice = Invoice.new
    redirect_to user_path
  end

  def create
    @invoice = Invoice.create(invoice_params)
    @invoice.save

    redirect_to user_path
  end

  private

  def invoice_params
    params.require(:invoice).permit(:xml_file)
  end
end
