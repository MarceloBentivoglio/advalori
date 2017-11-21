class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.create(invoice_params)
    @invoice.save

    redirect_to user_path(current_user)
  end

  private

  def invoice_params
    params.require(:invoice).permit(:xml_file)
  end
end
