class Investor::OrdersController < ApplicationController
  def index
    @orders = current_user.investor.orders
  end

  def show
  end

  def create
    invoice = Invoice.find(params[:invoice_id])

    @order = Order.new
    @order.investor = current_user.investor
    @order.invoice = invoice
    @order.fee = 0.95
    @order.save

    invoice.update(status: 'Sold')
    redirect_to investor_orders_path

  end
end
