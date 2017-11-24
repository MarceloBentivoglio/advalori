class ChartsController < ApplicationController
  def expenses_chart
    render json: Expense.where(seller_id: current_user)
                  .where('due_date > ?', DateTime.now)
                  .group_by_day(:due_date)
                  .sum("value")
  end

  def calc_expenses_chart
    today_date = Time.now
    expenses = Expense.where(seller_id: current_user.seller).where('due_date > ?', DateTime.now).group_by_day(:due_date).sum("-value")
    installments = Installment.joins(:invoice).where("invoices.seller_id" => current_user.seller).where('due_date > ?', DateTime.now).group_by_day(:due_date).sum("value")
    cash_flow = expenses.merge(installments) {|date, expense, installment| expense + installment }
    render json: cash_flow
  end


end
