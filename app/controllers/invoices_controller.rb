class InvoicesController < ApplicationController
  def index
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
    else
      @invoice = Invoice.new(invoice_params)
      @invoice.seller = current_user.seller
      @invoice.save!
    end

    redirect_to user_path
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number, :total_value, installments_attributes: [:id, :number, :value, :due_date, :_destroy])
  end

  def invoices
    current_user.seller.invoices
  end
end
