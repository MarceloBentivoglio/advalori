class ChartsController < ApplicationController
  def expenses_chart
    render json: Expense.where(seller_id: current_user)
                  .group_by_day(:due_date)
                  .sum("-value")
  end

  def calc_expenses_chart
    # render json: Expense.where(seller_id: current_user)
    #               .group_by_day(:due_date)
    #               .sum("value")
    #render json: Expense.joins("JOIN installments ON expenses.due_date = installments.due_date INNER JOIN invoices ON invoices.id = installments.invoice_id").where("expenses.seller_id = :seller_id AND invoices.seller_id = :seller_id", seller_id: current_user).group_by_day("expenses.due_date").sum("installments.value - expenses.value")
    expenses = Expense.where(seller_id: current_user).group_by_day(:due_date).sum("-value")
    installments = Installment.joins(:invoice).where("invoices.seller_id" => current_user).group_by_day(:due_date).sum("value")
    cash_flow = expenses.merge(installments) {|date, expense, installment| expense + installment }
    render json: cash_flow
  end

  def calc_cash_flow_chart
    Expense.joins("JOIN installments ON expenses.due_date = installments.due_date INNER JOIN invoices ON invoices.id = installments.invoice_id").where("expenses.seller_id = :seller_id AND invoices.seller_id = :seller_id", seller_id: 1).group_by_day("expenses.due_date").sum("installments.value - expenses.value").where(seller_id: current_user)
  end
end
