class ChartsController < ApplicationController
  def expenses_chart
    render json: Expense.where(seller_id: current_user.seller)
                  .where('due_date > ?', DateTime.now)
                  .group_by_day(:due_date)
                  .sum("value")
  end

  def calc_expenses_chart
    # Expenses should be grouped by day
    expenses = Expense.where(seller_id: current_user.seller).where('due_date > ?', DateTime.now).group_by_day(:due_date).sum("-value")

    # Installments should be grouped by day
    installments = Installment.joins(:invoice).where("invoices.seller_id" => current_user.seller).where('due_date > ?', DateTime.now).group_by_day(:due_date).sum("value")

    last_date = [expenses.keys.max, installments.keys.max].max
    period = (Date.current..last_date).map {|date| [date, 0] }.to_h

    # Merge daily expenses + intallments
    daily_cash_balance = period.merge(expenses).merge(installments) {|date, expense, installment| expense + installment }.to_a
    daily_cash_balance.sort_by! {|date, balance| date}

    render json: accumulate(daily_cash_balance)
  end

  def incomes_chart
    render json: Installment.joins(:invoice).where("invoices.seller_id" => current_user.seller)
                  .where('due_date > ?', DateTime.now)
                  .group_by_day(:due_date)
                  .sum("value")
  end

  private

    def accumulate(daily_balances)
      current_balance = 10000
      accumulated_balances = []
      daily_balances.each_with_index do |entry, i|
        date, balance = entry
        day_total = balance

        if i > 0
          day_total += accumulated_balances[i - 1][1]
        else
          day_total += current_balance
        end

        accumulated_balances << [date, day_total]
      end

      accumulated_balances
    end
end
