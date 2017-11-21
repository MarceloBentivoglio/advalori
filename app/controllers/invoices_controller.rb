class InvoicesController < ApplicationController
  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.create(invoice_params)

    @invoice.save
  end

  private

  def invoice_params
    params.require(:invoice).permit(:xml_file)
  end


end
