class ChartsController < ApplicationController
  def expenses_chart
    render json: Expense.where(seller_id: 1).group_by_day(:due_date).sum("value")
  end
end
